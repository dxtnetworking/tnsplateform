# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  
  has_one :profile, dependent: :destroy
  before_create :build_profile
  accepts_nested_attributes_for :profile#, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
end
