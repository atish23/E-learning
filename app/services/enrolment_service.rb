# app/services/enrollment_service.rb

class EnrolmentService
  def self.create_enrollment(batch_id, user_id)
    batch = Batch.find(batch_id)
    user = User.find(user_id)

    if batch.start_date < Date.today
      return { success: false, message: "Batch has already started" }
    end

    if EnrolmentRequest.exists?(batch_id: batch_id, student_id: user_id)
      return { success: false, message: "Enrollment request already exists" }
    end

    EnrolmentRequest.create(batch_id: batch_id, student_id: user_id)
    { success: true, message: "Enrollment request created successfully" }
  end
end
