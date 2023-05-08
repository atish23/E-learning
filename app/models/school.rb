class School < ApplicationRecord
  has_many :courses
  has_many :school_admins

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :contact_details, presence: true
end
