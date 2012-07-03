require 'spec_helper'

describe FavoritesController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end

  it 'should list a users fav code' do
    get :index
    assigns[:favorites].should_not be_nil
    response.should render_template 'index'
  end

  it 'should create a favorite' do
    @create_params = {"user"=>
                        {"favorite"=>
                          {"repo_name"=>"test", "repo_url"=>"test"}
                        }
                      }
    post :create, @create_params
    response.should redirect_to(favorites_index_path)
    flash[:notice].should == "Code has been loved!"
  end

  it 'should destroy a favorite' do
    @favorite = FactoryGirl.create(:favorite)
    delete :destroy, :id => @favorite.id
    response.should redirect_to(favorites_index_path)
    flash[:notice].should == "You have unloved some code, and prob made a dev cry."
  end

end
