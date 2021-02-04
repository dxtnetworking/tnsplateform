class Telephone < ApplicationRecord
  belongs_to :profile
  
  validates :numero, presence: true, allow_blank: false
end
