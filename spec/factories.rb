FactoryGirl.define do
  factory :user do
    name "First Last"
    uid 12345
  end

  factory :favorite do
    repo_name "Awesome Project"
    repo_url "http://www.github.com"
    repo_description "text"
    association :user, :factory => :user 
  end

end