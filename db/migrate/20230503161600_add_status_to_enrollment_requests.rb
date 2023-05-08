class AddStatusToEnrollmentRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :enrolment_requests, :status, :integer, default: 0
  end
end
