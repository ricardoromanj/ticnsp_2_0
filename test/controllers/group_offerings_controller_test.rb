require 'test_helper'

class GroupOfferingsControllerTest < ActionController::TestCase
  setup do
    @group_offering = group_offerings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_offerings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_offering" do
    assert_difference('GroupOffering.count') do
      post :create, group_offering: { group_id: @group_offering.group_id, group_type: @group_offering.group_type, semester_id: @group_offering.semester_id }
    end

    assert_redirected_to group_offering_path(assigns(:group_offering))
  end

  test "should show group_offering" do
    get :show, id: @group_offering
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_offering
    assert_response :success
  end

  test "should update group_offering" do
    patch :update, id: @group_offering, group_offering: { group_id: @group_offering.group_id, group_type: @group_offering.group_type, semester_id: @group_offering.semester_id }
    assert_redirected_to group_offering_path(assigns(:group_offering))
  end

  test "should destroy group_offering" do
    assert_difference('GroupOffering.count', -1) do
      delete :destroy, id: @group_offering
    end

    assert_redirected_to group_offerings_path
  end
end
