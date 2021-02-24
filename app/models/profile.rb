class Profile < ApplicationRecord
  belongs_to :user
  
  has_many :formations, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :telephones, dependent: :destroy
  has_many :profile_socials, dependent: :destroy
  
  has_and_belongs_to_many :clubs
  has_and_belongs_to_many :centre_interets
  has_and_belongs_to_many :habilites_extra_pros  
end
