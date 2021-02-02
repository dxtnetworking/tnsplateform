class Formation < ApplicationRecord
  belongs_to :profile
  
  validates :intitule, presence: true, allow_blank: false
  validates :niveau, presence: true, allow_blank: false
  validates :nom_institution, presence: true, allow_blank: false
  validates :localisation, presence: true, allow_blank: false
  validates :localisation, presence: true, allow_blank: false  
end
