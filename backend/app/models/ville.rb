class Ville < ApplicationRecord
  belongs_to :pay
  
  validates :nom, presence: true
end
