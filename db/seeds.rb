require 'faker'

# Roles
student_role = Role.find_or_create_by(name: 'Student')
school_admin_role = Role.find_or_create_by(name: 'SchoolAdmin')
admin_role = Role.find_or_create_by(name: 'Admin')

# Permissions
admin_permissions = [
  'schools_create', 
  'school_admins_create', 
  'school_admins_update', 
  'school_admins_destroy', 
  'courses_create', 
  'batches_create', 
  'batches_update', 
  'batches_destroy', 
  'batch_students_create', 
  'batch_students_destroy',
  'enrollment_requests_approve',
  'enrollment_requests_deny',
]

school_admin_permissions = [
  'schools_update',
  'courses_create',
  'batches_create',
  'batches_update',
  'batch_students_create',
  'enrollment_requests_create',
  'enrollment_requests_approve',
  'enrollment_requests_deny'
]

student_permissions = [
  'enrollment_requests_create',
  'batch_students_index'
]

# Assign permissions to roles
admin_role.permissions = admin_permissions.map { |name| Permission.create(name: name) }
school_admin_role.permissions = school_admin_permissions.map { |name| Permission.create(name: name) }
student_role.permissions =  student_permissions.map { |name| Permission.create(name: name) }


# Create Admin user
User.create!(
  name: 'Admin User',
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
  role: admin_role
)

# Create SchoolAdmin user
User.create!(
  name: Faker::Name.name,
  email: "school_admin@example.com",
  password: "password",
  password_confirmation: "password",
  role: school_admin_role
)

# Create Students
20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = "#{first_name} #{last_name}"
  email = Faker::Internet.email(name: name, separators: '.')

  User.create!(
    name: name,
    email: email,
    password: "password",
    password_confirmation: "password",
    role: student_role
  )
  puts "Created student: #{name} (#{email})"
end

# Create Schools
school1 = School.create!(
  name: "School 1",
  address: "123 Main St",
  contact_details: 'contact@example.com'
)


school2 = School.create!(
  name: "School 2",
  address: "123 Main St",
  contact_details: 'contact2@example.com'
)


# Create Courses for School 1
course1_school1 = Course.create!(
  name: "Math 101",
  description: "Intro to Algebra",
  school: school1
)

course2_school1 = Course.create!(
  name: "History 101",
  description: "Intro to US History",
  school: school1
)

# Create Courses for School 2
course1_school2 = Course.create!(
  name: "English 101",
  description: "Intro to English",
  school: school2,
  duration: 6
)

course2_school2 = Course.create!(
  name: "Science 101",
  description: "Intro to Biology",
  school: school2,
  duration: 4
)

# Create Batches for Course 1 in School 1
batch1_course1_school1 = Batch.create!(
  start_date: Date.new(2023, 1, 1),
  end_date: Date.new(2023, 5, 31),
  course: course1_school1
)

batch2_course1_school1 = Batch.create!(
  start_date: Date.new(2023, 9, 1),
  end_date: Date.new(2023, 12, 31),
  course: course1_school1
)

# Create Batches for Course 1 in School 2
batch1_course1_school2 = Batch.create!(
  start_date: Date.new(2023, 1, 1),
  end_date: Date.new(2023, 5, 31),
  course: course1_school2
)

batch2_course1_school2 = Batch.create!(
  start_date: Date.new(2023, 9, 1),
  end_date: Date.new(2023, 12, 31),
  course: course1_school2
)

# Create Enrolment Requests for Student in Batches
enrolment_request1 = EnrolmentRequest.create!(
  student: student,
  batch: batch1_course1_school1,
  status: 0
)

enrolment_request2 = EnrolmentRequest.create!(
  student: student,
  batch: batch1_course1_school2,
  status: 1
)
