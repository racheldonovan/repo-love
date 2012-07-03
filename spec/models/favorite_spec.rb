require 'spec_helper'

describe Favorite do
  describe "validations" do
  	before(:each) do
      @favorite = FactoryGirl.create(:favorite)
  	end

    it 'should be valid without description' do
      @favorite.repo_description = nil
      @favorite.should be_valid
    end

    it 'should be invalid without repo name' do
      @favorite.repo_name = nil
      @favorite.should be_invalid
    end

    it 'should be invalid without repo url' do
      @favorite.repo_url = nil
      @favorite.should be_invalid
    end
  end

end
