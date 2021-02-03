class ReseauSocial < ApplicationRecord
  validates :nom_reseau, presence: true
  validates :url, presence: true
end
