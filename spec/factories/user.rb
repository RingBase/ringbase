FactoryGirl.define do
  factory :user do
    full_name { Faker::Name.name }
    email     { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end
