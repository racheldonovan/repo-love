class FavoritesController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @favorites = @user.favorites
  end

  def create
    @user = User.find(session[:user_id])
    @favorite = @user.favorites.create(params[:user][:favorite])
    redirect_to favorites_index_path
  end

  def destroy
  end
end
