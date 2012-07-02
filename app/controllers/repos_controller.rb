class ReposController < ApplicationController
  def index
  end

  def search
  	@keyword = params[:keyword]
    github = Github.new
    @results = github.search.repos keyword: @keyword
  end
end
