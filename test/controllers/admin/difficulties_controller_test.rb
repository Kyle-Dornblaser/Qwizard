require 'test_helper'

class Admin::DifficultiesControllerTest < ActionController::TestCase
  setup do
    @admin_difficulty = admin_difficulties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_difficulties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_difficulty" do
    assert_difference('Admin::Difficulty.count') do
      post :create, admin_difficulty: { points: @admin_difficulty.points }
    end

    assert_redirected_to admin_difficulty_path(assigns(:admin_difficulty))
  end

  test "should show admin_difficulty" do
    get :show, id: @admin_difficulty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_difficulty
    assert_response :success
  end

  test "should update admin_difficulty" do
    patch :update, id: @admin_difficulty, admin_difficulty: { points: @admin_difficulty.points }
    assert_redirected_to admin_difficulty_path(assigns(:admin_difficulty))
  end

  test "should destroy admin_difficulty" do
    assert_difference('Admin::Difficulty.count', -1) do
      delete :destroy, id: @admin_difficulty
    end

    assert_redirected_to admin_difficulties_path
  end
end
