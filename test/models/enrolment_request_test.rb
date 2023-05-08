require 'test_helper'

class EnrolmentRequestTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @batch = batches(:one)
    @enrolment_request = EnrolmentRequest.new(student: @user, batch: @batch)
  end

  test "should be valid" do
    assert @enrolment_request.valid?
  end

  test "student should be present" do
    @enrolment_request.student = nil
    assert_not @enrolment_request.valid?
  end

  test "batch should be present" do
    @enrolment_request.batch = nil
    assert_not @enrolment_request.valid?
  end

  test "status should default to pending" do
    assert @enrolment_request.pending?
  end
end
