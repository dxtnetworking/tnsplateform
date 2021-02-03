FactoryBot.define do
  factory :ville do
    nom { Faker::Address.city }
    pay_id { FactoryBot.create(:pay).id }
  end
end
