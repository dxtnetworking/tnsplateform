class Club < ApplicationRecord
  belongs_to :ville
  
  has_and_belongs_to_many :profiles
  
  validates :nom, presence: true
  
end
