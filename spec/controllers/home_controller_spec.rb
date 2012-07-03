require 'spec_helper'

describe HomeController do
	it 'should redirect to repo search if user is logged in' do
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
    get :index
    response.should redirect_to(repos_index_path)
  end

  it 'should render index if not signed in' do
    get :index
    response.should render_template 'index'
  end
end