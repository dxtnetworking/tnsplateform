FactoryBot.define do
  factory :habilites_extra_pro do
    nom { Faker::Name.name }
    description { Faker::Lorem.sentences }
  end
end
