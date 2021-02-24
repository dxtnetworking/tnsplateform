class Ville < ApplicationRecord
  belongs_to :pay
  
  has_many :clubs, dependent: :destroy
  
  validates :nom, presence: true
end
