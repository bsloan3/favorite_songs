class FavoritesController < ApplicationController
  # def new
  #   require_user
  #   @favorite=Favorite.new
  # end

  def create
    @favorite=Favorite.new(song_id: params[:id], user_id: current_user.id)
    if @favorite.save
      redirect_to '/'
    else
      @errors = "Try again."
      render '/songs/new'
    end
  end

  def delete
    @favorite=Favorite.find_by(song_id: params[:id], user_id: current_user.id)
    @favorite.destroy!
    redirect_to '/'
  end
end
