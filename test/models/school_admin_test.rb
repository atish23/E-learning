require 'test_helper'

class SchoolAdminTest < ActiveSupport::TestCase
  def setup
    @school = schools(:one)
    @user = users(:one)
    @school_admin = SchoolAdmin.new(school: @school, user: @user)
  end

  test "should belong to a school" do
    @school_admin.school = nil
    assert_not @school_admin.valid?
  end

  test "should belong to a user" do
    @school_admin.user = nil
    assert_not @school_admin.valid?
  end

end
