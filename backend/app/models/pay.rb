class Pay < ApplicationRecord
  validates :nom, presence: true
  validates :code_iso, presence: true  
end
