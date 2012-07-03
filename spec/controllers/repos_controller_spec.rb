require 'spec_helper'

describe ReposController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end

  describe "search" do
    it 'should return results from github' do
      post :search, :keyword => "rails"
      assigns[:keyword].should == "rails" 
      assigns[:results].should_not be_nil
      response.should render_template 'search'
    end

    it 'should handle blank keyword' do
      post :search, :keyword => ""
      response.should redirect_to(repos_index_path)
      flash[:notice].should == "You need to enter a keyword first. Let's try this again!"
    end

    it 'should handle multi word search terms' do
      post :search, :keyword => "Ruby on Rails"
      assigns[:keyword].should == "Ruby on Rails"
      assigns[:results].should_not be_nil
      response.should render_template 'search'
    end
  end

end
