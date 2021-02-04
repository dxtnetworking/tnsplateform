class Pay < ApplicationRecord
  has_many :pays
  
  validates :nom, presence: true
  validates :code_iso, presence: true  
end
