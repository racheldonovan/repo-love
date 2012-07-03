class HomeController < ApplicationController
  def index
  	if current_user
  		redirect_to repos_index_path
    end
  end
end
