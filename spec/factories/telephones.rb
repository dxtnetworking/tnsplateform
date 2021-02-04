FactoryBot.define do
  factory :telephone do
    numero_principal { false }
    numero { Faker::PhoneNumber.phone_number }
    profile_id { FactoryBot.create(:profile).id }
  end
end
