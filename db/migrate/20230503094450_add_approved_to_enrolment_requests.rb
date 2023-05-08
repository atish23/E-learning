class AddApprovedToEnrolmentRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :enrolment_requests, :approved, :boolean, default: false
  end
end
