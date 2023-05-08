class User < ApplicationRecord
  ROLES = Role::ROLES

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :enrolment_requests, foreign_key: :student_id
  has_many :batches, through: :enrolment_requests
  has_many :school_admins
  has_many :schools, through: :school_admins

  belongs_to :role, optional: true

  scope :by_role, -> (role_name) { joins(:role).where(roles: { name: role_name }) }

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :phone_number, format: { with: /\A[0-9]{10}\z/, message: "must be a 10-digit number" }, allow_blank: true

  ROLES.each do |role|
    define_method("#{role.downcase}?") do
      self.role&.name == role
    end
  end
end
