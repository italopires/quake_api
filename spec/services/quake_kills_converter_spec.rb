require 'rails_helper'

RSpec.describe QuakeKillsConverter do
  let(:qgames) { File.join("#{Rails.root}/spec/fixtures/qgames.log") }
  let(:open_file) { fixture_file_upload('qgames.log', 'text/plain') }
  let(:result) do
    {
      "gamer_1": {
        "total_kills": 1069,
        "players": [
          "Isgalamido",
          "Mocinha",
          "Zeh",
          "Dono",
          "Bola",
          "Assasinu",
          "Credi",
          "Oootsimo",
          "UnnamedPlayer",
          "Maluquinho",
          "Mal",
          "Chessus"
        ],
        "kills": {
          "Isgalamido" => 147,
          "Zeh" => 124,
          "Dono" => -40,
          "Bola"=> 103,
          "Assasinu"=> -32,
          "Credi"=> 143,
          "Oootsimo"=> 114,
          "Maluquinho"=> 0,
          "Mal"=> -3,
          "Chessus"=> 33
        }
      }
   }
  end

  subject { described_class.new(open_file).perform }


  it 'it returns the aggregated result' do
    is_expected.to eq result
  end
end