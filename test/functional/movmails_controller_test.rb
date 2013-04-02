require 'test_helper'

class MovmailsControllerTest < ActionController::TestCase
  setup do
    @movmail = movmails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movmails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movmail" do
    assert_difference('Movmail.count') do
      post :create, movmail: {  }
    end

    assert_redirected_to movmail_path(assigns(:movmail))
  end

  test "should show movmail" do
    get :show, id: @movmail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movmail
    assert_response :success
  end

  test "should update movmail" do
    put :update, id: @movmail, movmail: {  }
    assert_redirected_to movmail_path(assigns(:movmail))
  end

  test "should destroy movmail" do
    assert_difference('Movmail.count', -1) do
      delete :destroy, id: @movmail
    end

    assert_redirected_to movmails_path
  end
end
