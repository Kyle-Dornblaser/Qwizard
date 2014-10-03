require 'test_helper'

class UserResponsesControllerTest < ActionController::TestCase
  setup do
    @user_response = user_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_response" do
    assert_difference('UserResponse.count') do
      post :create, user_response: { award: @user_response.award, questioninstance_id: @user_response.questioninstance_id, response: @user_response.response, user_id: @user_response.user_id }
    end

    assert_redirected_to user_response_path(assigns(:user_response))
  end

  test "should show user_response" do
    get :show, id: @user_response
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_response
    assert_response :success
  end

  test "should update user_response" do
    patch :update, id: @user_response, user_response: { award: @user_response.award, questioninstance_id: @user_response.questioninstance_id, response: @user_response.response, user_id: @user_response.user_id }
    assert_redirected_to user_response_path(assigns(:user_response))
  end

  test "should destroy user_response" do
    assert_difference('UserResponse.count', -1) do
      delete :destroy, id: @user_response
    end

    assert_redirected_to user_responses_path
  end
end
