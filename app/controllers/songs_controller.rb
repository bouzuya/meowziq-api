class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.where(deleted_at: nil).order(id: :asc)
  end

  def show
  end

  def create
    @song = Song.create! song_params
    render :show, status: :created, location: @song
  end

  def update
    @song.update! song_params
    render :show, status: :ok, location: @song
  end

  def destroy
    @song.destroy!
    head :no_content
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.permit(:artist, :artwork_url, :title)
  end
end
