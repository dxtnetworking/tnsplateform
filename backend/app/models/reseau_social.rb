class ReseauSocial < ApplicationRecord
  has_many :profile_socials

  validates :nom_reseau, presence: true
  validates :url, presence: true
end
