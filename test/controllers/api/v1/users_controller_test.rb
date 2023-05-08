require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
  end

  test "should show user" do
    sign_in users(:one)
    get :show, params: { id: users(:two).id }
    assert_response :success
  end

  test "should update user" do
    sign_in users(:one)
    put :update, params: { id: users(:two).id, user: { name: "Jane Doe" } }
    assert_response :success
  end

end
