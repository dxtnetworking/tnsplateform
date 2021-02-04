FactoryBot.define do
  factory :profile_social do
    lien_profile { Faker::Internet.url }
    profile_id { FactoryBot.create(:profile).id }
    reseau_social_id { FactoryBot.create(:reseau_social).id }
  end
end
