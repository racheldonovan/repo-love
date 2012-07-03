class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      session[:user_id] = nil
    end
  end

  def req_user
    unless current_user
      redirect_to root_url, :notice => "Good try, but you are going to have to sign in first!"
    end
  end
end
