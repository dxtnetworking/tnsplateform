class Experience < ApplicationRecord
  belongs_to :profile
  
  
  validates :titre_poste, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :type_poste, presence: true, allow_blank: false
  validates :localisation, presence: true, allow_blank: false
  validates :debut_occupation_poste, presence: true, allow_blank: false
  
end
