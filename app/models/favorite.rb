class Favorite < ActiveRecord::Base
  belongs_to :user
  attr_accessible :repo_description, :repo_id, :repo_name, :repo_url
end
