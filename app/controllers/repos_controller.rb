class ReposController < ApplicationController
  before_filter :req_user

  def index
  end

  def search
  	@user = User.find(current_user)
  	@keyword = params[:keyword]
    github = Github.new
    begin
      @results = github.search.repos keyword: @keyword.parameterize
    rescue 
      if @keyword.blank? || @results.nil? || @results.blank?
        redirect_to repos_index_path, :notice => "You need to enter a keyword first. Let's try this again!"
      end
    rescue Exception
      redirect_to repos_index_path, :notice => "Stop trying to break me!"
    end
      
  end
end
