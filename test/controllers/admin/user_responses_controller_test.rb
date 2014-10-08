require 'test_helper'

class Admin::UserResponsesControllerTest < ActionController::TestCase
  setup do
    @admin_user_response = admin_user_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_user_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_user_response" do
    assert_difference('Admin::UserResponse.count') do
      post :create, admin_user_response: { award: @admin_user_response.award, question_instance_id: @admin_user_response.question_instance_id, response: @admin_user_response.response, user_id: @admin_user_response.user_id }
    end

    assert_redirected_to admin_user_response_path(assigns(:admin_user_response))
  end

  test "should show admin_user_response" do
    get :show, id: @admin_user_response
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_user_response
    assert_response :success
  end

  test "should update admin_user_response" do
    patch :update, id: @admin_user_response, admin_user_response: { award: @admin_user_response.award, question_instance_id: @admin_user_response.question_instance_id, response: @admin_user_response.response, user_id: @admin_user_response.user_id }
    assert_redirected_to admin_user_response_path(assigns(:admin_user_response))
  end

  test "should destroy admin_user_response" do
    assert_difference('Admin::UserResponse.count', -1) do
      delete :destroy, id: @admin_user_response
    end

    assert_redirected_to admin_user_responses_path
  end
end
