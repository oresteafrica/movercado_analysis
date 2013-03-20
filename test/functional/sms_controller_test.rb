require 'test_helper'

class SmsControllerTest < ActionController::TestCase
  setup do
    @sm = sms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sm" do
    assert_difference('Sm.count') do
      post :create, sm: { body: @sm.body, recipient_phone_id: @sm.recipient_phone_id, sender_phone_id: @sm.sender_phone_id, sent_at: @sm.sent_at }
    end

    assert_redirected_to sm_path(assigns(:sm))
  end

  test "should show sm" do
    get :show, id: @sm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sm
    assert_response :success
  end

  test "should update sm" do
    put :update, id: @sm, sm: { body: @sm.body, recipient_phone_id: @sm.recipient_phone_id, sender_phone_id: @sm.sender_phone_id, sent_at: @sm.sent_at }
    assert_redirected_to sm_path(assigns(:sm))
  end

  test "should destroy sm" do
    assert_difference('Sm.count', -1) do
      delete :destroy, id: @sm
    end

    assert_redirected_to sms_path
  end
end
