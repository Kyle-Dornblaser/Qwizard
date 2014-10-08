require 'test_helper'

class Admin::QuestionInstancesControllerTest < ActionController::TestCase
  setup do
    @admin_question_instance = admin_question_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_question_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_question_instance" do
    assert_difference('Admin::QuestionInstance.count') do
      post :create, admin_question_instance: { question_id: @admin_question_instance.question_id }
    end

    assert_redirected_to admin_question_instance_path(assigns(:admin_question_instance))
  end

  test "should show admin_question_instance" do
    get :show, id: @admin_question_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_question_instance
    assert_response :success
  end

  test "should update admin_question_instance" do
    patch :update, id: @admin_question_instance, admin_question_instance: { question_id: @admin_question_instance.question_id }
    assert_redirected_to admin_question_instance_path(assigns(:admin_question_instance))
  end

  test "should destroy admin_question_instance" do
    assert_difference('Admin::QuestionInstance.count', -1) do
      delete :destroy, id: @admin_question_instance
    end

    assert_redirected_to admin_question_instances_path
  end
end
