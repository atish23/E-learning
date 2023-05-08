class Course < ApplicationRecord
  belongs_to :school
  has_many :batches, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }

end
