class EnrolmentRequest < ApplicationRecord
  enum status: %i[pending approved rejected]

  belongs_to :student, class_name: 'User'
  belongs_to :batch
end
