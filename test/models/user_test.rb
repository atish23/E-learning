require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    user = User.new(name: "John Doe", email: "john.doe@example.com", password: "password", password_confirmation: "password")
    assert user.valid?
  end

  test "should not be valid without a name" do
    user = User.new(email: "john.doe@example.com", password: "password", password_confirmation: "password")
    assert_not user.valid?
  end

  test "should not be valid without an email" do
    user = User.new(name: "John Doe", password: "password", password_confirmation: "password")
    assert_not user.valid?
  end

  test "should not be valid without a password" do
    user = User.new(name: "John Doe", email: "john.doe@example.com")
    assert_not user.valid?
  end

  test "should not be valid with a short name" do
    user = User.new(name: "J", email: "john.doe@example.com", password: "password", password_confirmation: "password")
    assert_not user.valid?
  end

  test "should not be valid with a long name" do
    user = User.new(name: "J" * 51, email: "john.doe@example.com", password: "password", password_confirmation: "password")
    assert_not user.valid?
  end

  test "should not be valid with an invalid phone number" do
    user = User.new(name: "John Doe", email: "john.doe@example.com", password: "password", password_confirmation: "password", phone_number: "123")
    assert_not user.valid?
  end

  test "should have many enrolment requests" do
    user = users(:one)
    assert_instance_of EnrolmentRequest, user.enrolment_requests.new(batch: batches(:one))
  end

  test "should have many batches" do
    user = users(:one)
    assert_instance_of Batch, user.batches.new(name: "Batch 3")
  end

  test "should have many school admins" do
    user = users(:one)
    assert_instance_of SchoolAdmin, user.school_admins.new(school: schools(:one))
  end

  test "should have many schools" do
    user = users(:one)
    assert_instance_of School, user.schools.new(name: "School 3")
  end

  test "should belong to a role" do
    user = users(:one)
    assert_instance_of Role, user.role
  end

  test "should define a dynamic method for each role" do
    user = users(:one)

    User::ROLES.each do |role|
      assert_respond_to user, "#{role.downcase}?"
    end
  end
end
