require "faker"

FactoryBot.define do
  factory :pay do
    nom { Faker::Name.name }
    code_iso { "ABC" }
  end
end
