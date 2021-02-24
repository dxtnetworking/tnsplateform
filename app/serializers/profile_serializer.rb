class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :niveau_etude, :profession, :occupation_actuelle,
             :attentes_networking, :membre_equipe_pilote, :adresse,
             :statut, :date_adhesion, :date_resiliation, :motif_resiliation

  belongs_to :user
  
  has_many :formations, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :telephones, dependent: :destroy
  has_many :profile_socials, dependent: :destroy
  
  # has_and_belongs_to_many :clubs
  # has_and_belongs_to_many :centre_interets
  # has_and_belongs_to_many :habilites_extra_pros 
end
