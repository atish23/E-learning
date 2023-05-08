require 'test_helper'

class BatchTest < ActiveSupport::TestCase
  def setup
    @course = courses(:one)
    @batch = Batch.new(name: "Batch 1", start_date: Date.today, end_date: Date.tomorrow, course: @course)
  end

  test "should be valid" do
    assert @batch.valid?
  end

  test "name should be present" do
    @batch.name = "     "
    assert_not @batch.valid?
  end

  test "start date should be present" do
    @batch.start_date = nil
    assert_not @batch.valid?
  end

  test "end date should be present" do
    @batch.end_date = nil
    assert_not @batch.valid?
  end

  test "course should be present" do
    @batch.course = nil
    assert_not @batch.valid?
  end

  test "should have many enrolment requests" do
    assert_respond_to @batch, :enrolment_requests
  end

  test "should have many students" do
    assert_respond_to @batch, :users
  end
end
