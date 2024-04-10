require 'rails_helper'

RSpec.describe QuakeDatasController, type: :controller do
  let(:qgames) { File.join("#{Rails.root}/spec/fixtures/qgames.log") }
  let(:open_file) { fixture_file_upload('qgames.log', 'text/plain') }

  describe '#create' do
    it 'it calls QuakeKillsConverter' do
      allow(QuakeKillsConverter).to receive(:new).and_call_original
      expect(QuakeKillsConverter).to receive(:new)
      post :create, params: { file: open_file }
    end

    it 'returns success status' do
      post :create, params: { file: open_file }
      expect(response).to have_http_status(:success)
    end
  end

  describe '#mods' do
    it 'it calls QuakeModsConverter' do
      allow(QuakeModsConverter).to receive(:new).and_call_original
      expect(QuakeModsConverter).to receive(:new)
      post :mods, params: { file: open_file }
    end

    it 'returns success status' do
      post :mods, params: { file: open_file }
      expect(response).to have_http_status(:success)
    end
  end
end