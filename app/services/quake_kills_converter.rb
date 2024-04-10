class QuakeKillsConverter
  KILLED = 'killed'
  WORLD = '<world>'

  def initialize(log)
    @values = {
      total_kills: 0,
      players: [],
      kills: {}
    }
    @log = log
  end

  def perform
    File.open(@log, "r") do |file|
      file.each_line do |line|
        splited = line.split
        killed = splited.index(KILLED)
        if killed.present?
          left_killed = splited[killed - 1]
          dead_character = splited[killed + 1]
          dead_character_kills = @values[:kills][dead_character]
          @values[:total_kills] = (@values[:total_kills] || 0) + 1
          if left_killed == WORLD
            @values[:players] = (@values[:players] + [dead_character]).uniq
            @values[:kills][dead_character] = (@values[:kills][dead_character] || 0) - 1
          else
            killer = splited[killed - 1]
            @values[:players] = (@values[:players] + [dead_character] + [killer]).uniq
            @values[:kills][killer] = (@values[:kills][killer] || 0) + 1
          end
        end
      end
    end

    { gamer_1: @values }
  end
end