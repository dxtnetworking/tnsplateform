FactoryBot.define do
  factory :reseau_social do
    nom_reseau { Faker::Company.name }
    url { Faker::Internet.url }
  end
end
