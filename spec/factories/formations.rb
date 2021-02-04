require 'faker'

FactoryBot.define do
  factory :formation do
    intitule { Faker::Name.name }
    niveau { Faker::Name.name }
    specialisation { nil }
    nom_institution { Faker::University.name }
    localisation { Faker::Address.city }
    debut_formation { Faker::Date.in_date_period(year: 2015) }
    fin_formation { Faker::Date.in_date_period(year: 2020) }
    
    profile_id { FactoryBot.create(:profile).id }
  end
end
