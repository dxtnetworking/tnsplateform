class Pay < ApplicationRecord
  has_many :villes, dependent: :destroy
  
  validates :nom, presence: true
  validates :code_iso, presence: true  
end
