class FavoritesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  
  def index
    @favorites = current_user.favorites.includes(:recipe)
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = current_user.favorites.build(favorite_params)
    @favorite.recipe = Recipe.find(params[:favorite][:recipe_id])

    if @favorite.save
      redirect_to favorites_path, notice: "Favorite created successfully"
    else
      render :new
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:recipe_id)
  end
end
