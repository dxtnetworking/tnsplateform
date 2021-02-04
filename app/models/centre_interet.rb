class CentreInteret < ApplicationRecord
  has_and_belongs_to_many :profiles

  validates :nom, presence: true
end
