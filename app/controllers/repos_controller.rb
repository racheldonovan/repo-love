class ReposController < ApplicationController
  def index
  end

  def search
  	@user = User.find(session[:user_id])
  	@keyword = params[:keyword]
    github = Github.new
    @results = github.search.repos keyword: @keyword
  end
end
