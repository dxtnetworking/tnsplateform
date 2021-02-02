require 'faker'


FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    nickname { Faker::Name.name }
    email  { Faker::Internet.safe_email } 
    password { "user12345" } 
  end
end