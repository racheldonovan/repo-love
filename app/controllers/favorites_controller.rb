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
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorites_index_path, :notice => 'You have unloved some code, and prob made a dev cry.'
  end
end
