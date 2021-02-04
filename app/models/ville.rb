class Ville < ApplicationRecord
  belongs_to :pay
  
  has_many :clubs
  
  validates :nom, presence: true
end
