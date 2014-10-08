require 'test_helper'

class Admin::ChoicesControllerTest < ActionController::TestCase
  setup do
    @admin_choice = admin_choices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_choices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_choice" do
    assert_difference('Admin::Choice.count') do
      post :create, admin_choice: { choice: @admin_choice.choice, correct_choice: @admin_choice.correct_choice, question_id: @admin_choice.question_id }
    end

    assert_redirected_to admin_choice_path(assigns(:admin_choice))
  end

  test "should show admin_choice" do
    get :show, id: @admin_choice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_choice
    assert_response :success
  end

  test "should update admin_choice" do
    patch :update, id: @admin_choice, admin_choice: { choice: @admin_choice.choice, correct_choice: @admin_choice.correct_choice, question_id: @admin_choice.question_id }
    assert_redirected_to admin_choice_path(assigns(:admin_choice))
  end

  test "should destroy admin_choice" do
    assert_difference('Admin::Choice.count', -1) do
      delete :destroy, id: @admin_choice
    end

    assert_redirected_to admin_choices_path
  end
end
