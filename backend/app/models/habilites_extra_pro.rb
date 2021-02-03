class HabilitesExtraPro < ApplicationRecord
  has_and_belongs_to_many :profiles
  
  validates :nom, presence: true, uniqueness: true
end
