require 'test_helper'

class CatechesesControllerTest < ActionController::TestCase
  setup do
    @catechese = catecheses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catecheses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catechese" do
    assert_difference('Catechesis.count') do
      post :create, catechese: { description: @catechese.description, image_id: @catechese.image_id, name: @catechese.name }
    end

    assert_redirected_to catechese_path(assigns(:catechese))
  end

  test "should show catechese" do
    get :show, id: @catechese
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catechese
    assert_response :success
  end

  test "should update catechese" do
    patch :update, id: @catechese, catechese: { description: @catechese.description, image_id: @catechese.image_id, name: @catechese.name }
    assert_redirected_to catechese_path(assigns(:catechese))
  end

  test "should destroy catechese" do
    assert_difference('Catechesis.count', -1) do
      delete :destroy, id: @catechese
    end

    assert_redirected_to catecheses_path
  end
end
