require 'test_helper'

class MorethansControllerTest < ActionController::TestCase
  setup do
    @morethan = morethans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:morethans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create morethan" do
    assert_difference('Morethan.count') do
      post :create, morethan: {  }
    end

    assert_redirected_to morethan_path(assigns(:morethan))
  end

  test "should show morethan" do
    get :show, id: @morethan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @morethan
    assert_response :success
  end

  test "should update morethan" do
    put :update, id: @morethan, morethan: {  }
    assert_redirected_to morethan_path(assigns(:morethan))
  end

  test "should destroy morethan" do
    assert_difference('Morethan.count', -1) do
      delete :destroy, id: @morethan
    end

    assert_redirected_to morethans_path
  end
end
