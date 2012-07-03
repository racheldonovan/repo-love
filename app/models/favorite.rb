class Favorite < ActiveRecord::Base
  belongs_to :user
  attr_accessible :repo_description, :repo_name, :repo_url

  validates :repo_name, :presence => true
  validates :repo_url, :presence => true
  validates :user_id, :presence => true
end
