class SchoolAdmin < ApplicationRecord
  belongs_to :user
  belongs_to :school

  validates :user_id, uniqueness: { scope: :school_id }
  validate :check_user_role

  def check_user_role
    unless user && user.role == Role::SCHOOL_ADMIN
      errors.add(:user, 'must have the role of school admin')
    end
  end
end
