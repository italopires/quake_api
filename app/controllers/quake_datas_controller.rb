class QuakeDatasController < ApplicationController
  def create
    file_content = params[:file].tempfile
    render json: QuakeKillsConverter.new(file_content).perform
  end

  def mods
    file_content = params[:file].tempfile

    render json: QuakeModsConverter.new(file_content).perform
  end
end