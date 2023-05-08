require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @school = schools(:one)
    @course = Course.new(name: "Maths", school_id: @school.id)
  end


  test "name should be present" do
    @course.name = "    "
    assert_not @course.valid?
  end

  test "name should not be too long" do
    @course.name = "a" * 51
    assert_not @course.valid?
  end

  test "should belong to a school" do
    @course.school_id = nil
    assert_not @course.valid?
  end

end

