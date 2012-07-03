class FavoritesController < ApplicationController
  before_filter :req_user

  def index
    @user = User.find(current_user)
    @favorites = @user.favorites
  end

  def create
    @user = User.find(current_user)
    @favorite = @user.favorites.create(params[:user][:favorite])
    redirect_to favorites_index_path, :notice => 'Code has been loved!'
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorites_index_path, :notice => 'You have unloved some code, and prob made a dev cry.'
  end
end
