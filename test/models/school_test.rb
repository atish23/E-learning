require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  def setup
    @school = schools(:one)
  end

  test "should be valid" do
    assert @school.valid?
  end

  test "name should be present" do
    @school.name = ""
    assert_not @school.valid?
  end

  test "name should be unique" do
    dup_school = @school.dup
    assert_not dup_school.valid?
  end

  test "address should be present" do
    @school.address = ""
    assert_not @school.valid?
  end

  test "contact_details should be present" do
    @school.contact_details = ""
    assert_not @school.valid?
  end
end
