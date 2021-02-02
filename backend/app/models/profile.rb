class Profile < ApplicationRecord
  belongs_to :user
  has_many :formations
  has_many :experiences
  
  validates :niveau_etude, presence: true, allow_blank: false
  validates :occupation_actuelle, presence: true, allow_blank: false
  
end
