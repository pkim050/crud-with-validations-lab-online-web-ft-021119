class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(songs_params)
    redirect_to @song and return if @song.save
    render :new
  end

  def show
    current_song
  end

  def edit
    current_song
  end

  def update
    current_song
    redirect_to @song and return if @song.update(songs_params)
    render :edit
  end

  private

  def songs_params
    params.permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def current_song
    @song = Song.find(params[:id])
  end

end
