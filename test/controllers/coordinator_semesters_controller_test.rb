require 'test_helper'

class CoordinatorSemestersControllerTest < ActionController::TestCase
  setup do
    @coordinator_semester = coordinator_semesters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coordinator_semesters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coordinator_semester" do
    assert_difference('CoordinatorSemester.count') do
      post :create, coordinator_semester: { coordinator_id: @coordinator_semester.coordinator_id, notes: @coordinator_semester.notes, semester_id: @coordinator_semester.semester_id }
    end

    assert_redirected_to coordinator_semester_path(assigns(:coordinator_semester))
  end

  test "should show coordinator_semester" do
    get :show, id: @coordinator_semester
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coordinator_semester
    assert_response :success
  end

  test "should update coordinator_semester" do
    patch :update, id: @coordinator_semester, coordinator_semester: { coordinator_id: @coordinator_semester.coordinator_id, notes: @coordinator_semester.notes, semester_id: @coordinator_semester.semester_id }
    assert_redirected_to coordinator_semester_path(assigns(:coordinator_semester))
  end

  test "should destroy coordinator_semester" do
    assert_difference('CoordinatorSemester.count', -1) do
      delete :destroy, id: @coordinator_semester
    end

    assert_redirected_to coordinator_semesters_path
  end
end
