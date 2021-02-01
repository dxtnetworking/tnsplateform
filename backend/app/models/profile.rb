class Profile < ApplicationRecord
  belongs_to :user
  
  validates :niveau_etude, presence: true, allow_blank: false
  validates :occupation_actuelle, presence: true, allow_blank: false
  
end
