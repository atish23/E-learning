class Batch < ApplicationRecord
  belongs_to :course
  has_many :enrolment_requests
  has_many :users, through: :enrolment_requests, source: :student

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :course, presence: true
end
