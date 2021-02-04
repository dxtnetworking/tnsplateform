FactoryBot.define do
  factory :club do
    nom { Faker::Company.name }
    ville_id { FactoryBot.create(:ville).id }
  end
end
