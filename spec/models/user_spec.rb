require 'spec_helper'

describe User do
  it 'should create from omniauth' do
    OmniAuth.config.test_mode = true
    auth = OmniAuth.config.mock_auth[:github] = {
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
    @user = User.create_with_omniauth(auth)
    @user.should == User.last
  end

  describe 'validations' do
    before(:each) do
      @user = FactoryGirl.build(:user)
      @user.should be_valid
    end

    it 'should require name' do
      @user.name = nil
      @user.should_not be_valid
    end

    it 'should require uid' do
      @user.uid = nil
      @user.should_not be_valid
    end

  end

  it 'should have favorites association' do
    FactoryGirl.create(:user).should respond_to(:favorites)
  end

end
