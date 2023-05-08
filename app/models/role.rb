class Role < ApplicationRecord
  ADMIN = 'Admin'.freeze
  SCHOOL_ADMIN = 'SchoolAdmin'.freeze
  STUDENT = 'Student'.freeze

  ROLES = [ADMIN, SCHOOL_ADMIN, STUDENT].freeze

  has_many :users
  has_many :role_permissions
  has_many :permissions, through: :role_permissions

  validates :name, inclusion: { in: ROLES, message: "must be one of #{ROLES.join(', ')}" }

  def permission?(permission_name)
    permissions.exists?(name: permission_name)
  end
end
