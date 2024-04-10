class QuakeModsConverter
  KILLED = 'killed'
  BY = 'by'

  def initialize(log)
    @kills_by_means = {}
    @log = log
  end

  def perform
    File.open(@log, "r") do |file|
      file.each_line do |line|
        file.each_line do |line|
          splited = line.split
          by = splited.index(BY)
          killed = splited.index(KILLED)
          if by.present? && killed.present?
            mod = splited[by + 1]
            @kills_by_means[mod] = (@kills_by_means[mod] || 0) + 1
          end
        end
      end
    end

    {'gamer-1' => { kills_by_means: @kills_by_means } }
  end
end
