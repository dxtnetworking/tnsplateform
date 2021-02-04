class ProfileSocial < ApplicationRecord
  belongs_to :profile
  belongs_to :reseau_social

  validates :lien_profile, presence: true
end
