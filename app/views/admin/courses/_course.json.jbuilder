json.extract! course, :id, :name, :description, :duration, :school_id, :created_at, :updated_at
json.url course_url(course, format: :json)
