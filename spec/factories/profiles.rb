require 'faker'

FactoryBot.define do
  factory :profile do
    adresse { Faker::Address.name }
    niveau_etude { Faker::Name.name }
    profession { "project manager" }
    occupation_actuelle { "employé" }
    attentes_networking { "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor..." }
    membre_equipe_pilote { false }
    statut { "actif" }
    date_adhesion { "2020-02-01" }
    date_resiliation { nil }
    motif_resiliation { nil }   
    # user_id { FactoryBot.create(:user).id }
  end
end