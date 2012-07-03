require 'spec_helper'

describe SessionsController do
	before(:each) do
    OmniAuth.config.test_mode = true
    @omniauth = OmniAuth.config.mock_auth[:github] = {
        'uid' => '12345',
        'provider' => 'github',
        'info' => {
          'name' => 'First Last'
        },
        'extra' => {
          'raw_info' => {
            'avatar_url' => "http://someimage.com"
          }
        }
      }
    request.env["omniauth.auth"] = @omniauth
  end

  it 'it should create session' do
    post :create, @omniauth
    response.should redirect_to(repos_index_path)

  end

  it 'should sign a user out' do
    session[:user_id] = 12345
    get :destroy
    session[:user_id].should be nil
  end
end
