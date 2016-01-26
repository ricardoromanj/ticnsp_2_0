require 'test_helper'

class ChildSemestersControllerTest < ActionController::TestCase
  setup do
    @child_semester = child_semesters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:child_semesters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create child_semester" do
    assert_difference('ChildSemester.count') do
      post :create, child_semester: { child_id: @child_semester.child_id, notes: @child_semester.notes, paid: @child_semester.paid, semester_id: @child_semester.semester_id }
    end

    assert_redirected_to child_semester_path(assigns(:child_semester))
  end

  test "should show child_semester" do
    get :show, id: @child_semester
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @child_semester
    assert_response :success
  end

  test "should update child_semester" do
    patch :update, id: @child_semester, child_semester: { child_id: @child_semester.child_id, notes: @child_semester.notes, paid: @child_semester.paid, semester_id: @child_semester.semester_id }
    assert_redirected_to child_semester_path(assigns(:child_semester))
  end

  test "should destroy child_semester" do
    assert_difference('ChildSemester.count', -1) do
      delete :destroy, id: @child_semester
    end

    assert_redirected_to child_semesters_path
  end
end
