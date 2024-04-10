require 'rails_helper'

RSpec.describe QuakeModsConverter do
  let(:qgames) { File.join("#{Rails.root}/spec/fixtures/qgames.log") }
  let(:open_file) { fixture_file_upload('qgames.log', 'text/plain') }

  let(:result) do
    {
      "gamer-1" => {
        "kills_by_means": {
          "MOD_TRIGGER_HURT" => 193,
          "MOD_ROCKET_SPLASH" => 349,
          "MOD_FALLING" => 45,
          "MOD_ROCKET" => 213,
          "MOD_RAILGUN" => 132,
          "MOD_MACHINEGUN" => 45,
          "MOD_SHOTGUN" => 25,
          "MOD_TELEFRAG" => 25,
          "MOD_BFG_SPLASH" => 24,
          "MOD_BFG" => 16,
          "MOD_CRUSH" => 2
        }
      }
    }
  end

  subject { described_class.new(open_file).perform }

  it 'it returns the aggregated result' do
    is_expected.to eq result
  end
end