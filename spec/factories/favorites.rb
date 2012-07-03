# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :favorite do
    repo_id 1
    repo_name "MyString"
    repo_url "MyString"
    repo_description "MyText"
    user nil
  end
end
