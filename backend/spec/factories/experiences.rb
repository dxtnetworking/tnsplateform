FactoryBot.define do
  factory :experience do
    titre_poste { "MyString" }
    description { "MyText" }
    poste_actuel { false }
    type_poste { "MyString" }
    nom_societe { "MyString" }
    localisation { "MyString" }
    debut_occupation_poste { "2021-02-02" }
    fin_occupation_poste { "2021-02-02" }
    profile_id { FactoryBot.create(:profile).id }
  end
end
