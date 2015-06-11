require 'test_helper'

class VisitorMessagesControllerTest < ActionController::TestCase
  setup do
    @visitor_message = visitor_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visitor_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visitor_message" do
    assert_difference('VisitorMessage.count') do
      post :create, visitor_message: { email: @visitor_message.email, message_text: @visitor_message.message_text, name: @visitor_message.name, read: @visitor_message.read, read_at: @visitor_message.read_at, replied: @visitor_message.replied, replied_at: @visitor_message.replied_at, replied_by_user_id: @visitor_message.replied_by_user_id }
    end

    assert_redirected_to visitor_message_path(assigns(:visitor_message))
  end

  test "should show visitor_message" do
    get :show, id: @visitor_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visitor_message
    assert_response :success
  end

  test "should update visitor_message" do
    patch :update, id: @visitor_message, visitor_message: { email: @visitor_message.email, message_text: @visitor_message.message_text, name: @visitor_message.name, read: @visitor_message.read, read_at: @visitor_message.read_at, replied: @visitor_message.replied, replied_at: @visitor_message.replied_at, replied_by_user_id: @visitor_message.replied_by_user_id }
    assert_redirected_to visitor_message_path(assigns(:visitor_message))
  end

  test "should destroy visitor_message" do
    assert_difference('VisitorMessage.count', -1) do
      delete :destroy, id: @visitor_message
    end

    assert_redirected_to visitor_messages_path
  end
end
