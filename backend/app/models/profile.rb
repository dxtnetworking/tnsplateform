class Profile < ApplicationRecord
  belongs_to :user
  
  has_many :formations
  has_many :experiences
  has_many :telephones
  has_many :profile_socials
  
  has_and_belongs_to_many :clubs
  has_and_belongs_to_many :centre_interets
  
  validates :niveau_etude, presence: true, allow_blank: false
  validates :occupation_actuelle, presence: true, allow_blank: false
  
end
