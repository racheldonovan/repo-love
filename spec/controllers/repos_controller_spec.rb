require 'spec_helper'

describe ReposController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "search" do
    it 'should return results from github' do
      post :search, :keyword => "rails"
      assigns[:keyword].should == "rails" 
      assigns[:results].should_not be_nil
      response.should render_template 'search'
    end
  end

end
