require 'test_helper'

class ShepperdingsControllerTest < ActionController::TestCase
  setup do
    @shepperding = shepperdings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shepperdings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shepperding" do
    assert_difference('Shepperding.count') do
      post :create, shepperding: { description: @shepperding.description, image_id: @shepperding.image_id, name: @shepperding.name }
    end

    assert_redirected_to shepperding_path(assigns(:shepperding))
  end

  test "should show shepperding" do
    get :show, id: @shepperding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shepperding
    assert_response :success
  end

  test "should update shepperding" do
    patch :update, id: @shepperding, shepperding: { description: @shepperding.description, image_id: @shepperding.image_id, name: @shepperding.name }
    assert_redirected_to shepperding_path(assigns(:shepperding))
  end

  test "should destroy shepperding" do
    assert_difference('Shepperding.count', -1) do
      delete :destroy, id: @shepperding
    end

    assert_redirected_to shepperdings_path
  end
end
