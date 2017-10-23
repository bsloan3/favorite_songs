class SongsController < ApplicationController
  def index
    @songs=Song.all
  end

  def show
    @song=Song.find_by(id: params[:id])
  end

  def new
    require_user
    @song=Song.new
  end

  def create
    @song=current_user.songs.new(title: params[:song][:title], artist: params[:song][:artist])
    if @song.save
      redirect_to '/'
    else
      @errors = "Try again."
      render '/songs/new'
    end
  end

  def delete
    @song=Song.find_by(id: params[:id])
    @song.destroy!
    redirect_to '/'
  end

  def edit
    @song=Song.find_by(id: params[:id])
  end

  def update
    @song=Song.find_by(id: params[:id])
    if @song.update(title: params[:song][:title], artist: params[:song][:artist], user_id: current_user.id)
      redirect_to '/songs/#{@song.id}'
    else
      @errors = "Try again."
      render '/songs/edit'
    end
  end
end
