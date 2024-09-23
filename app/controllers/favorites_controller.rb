class FavoritesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @favorites = current_user.favorites.includes(:event_place)
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = current_user.favorites.build(favorite_params)
    @favorite.event_place = EventPlace.find(params[:favorite][:event_place_id])
    @favorite.user = current_user

    if @favorite.save
      redirect_to favorites_path, notice: "Favorite created successfully"
    else
      render :new
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite
      Rails.logger.info "Deleting favorite with id: #{@favorite.id}"
      @favorite.destroy
      redirect_to favorites_path, notice: "Favorite deleted successfully"
    else
      redirect_to favorites_path, alert: "Favorite not found"
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:event_place_id)
  end
end
