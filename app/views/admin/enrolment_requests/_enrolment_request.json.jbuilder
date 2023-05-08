json.extract! enrolment_request, :id, :batch_id, :student_id, :status, :created_at, :updated_at
json.url enrolment_request_url(enrolment_request, format: :json)
