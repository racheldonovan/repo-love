class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  validates :name, :presence => true
  validates :uid, :presence => true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.image_url = auth["extra"]["raw_info"]["avatar_url"]
    end
  end
end
