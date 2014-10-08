require 'test_helper'

class Admin::QuestionsControllerTest < ActionController::TestCase
  setup do
    @admin_question = admin_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_question" do
    assert_difference('Admin::Question.count') do
      post :create, admin_question: { attempts: @admin_question.attempts, difficulty_id: @admin_question.difficulty_id, question: @admin_question.question, question_type: @admin_question.question_type }
    end

    assert_redirected_to admin_question_path(assigns(:admin_question))
  end

  test "should show admin_question" do
    get :show, id: @admin_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_question
    assert_response :success
  end

  test "should update admin_question" do
    patch :update, id: @admin_question, admin_question: { attempts: @admin_question.attempts, difficulty_id: @admin_question.difficulty_id, question: @admin_question.question, question_type: @admin_question.question_type }
    assert_redirected_to admin_question_path(assigns(:admin_question))
  end

  test "should destroy admin_question" do
    assert_difference('Admin::Question.count', -1) do
      delete :destroy, id: @admin_question
    end

    assert_redirected_to admin_questions_path
  end
end
