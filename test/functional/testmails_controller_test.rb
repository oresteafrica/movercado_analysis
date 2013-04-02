require 'test_helper'

class TestmailsControllerTest < ActionController::TestCase
  setup do
    @testmail = testmails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testmails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testmail" do
    assert_difference('Testmail.count') do
      post :create, testmail: {  }
    end

    assert_redirected_to testmail_path(assigns(:testmail))
  end

  test "should show testmail" do
    get :show, id: @testmail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @testmail
    assert_response :success
  end

  test "should update testmail" do
    put :update, id: @testmail, testmail: {  }
    assert_redirected_to testmail_path(assigns(:testmail))
  end

  test "should destroy testmail" do
    assert_difference('Testmail.count', -1) do
      delete :destroy, id: @testmail
    end

    assert_redirected_to testmails_path
  end
end
