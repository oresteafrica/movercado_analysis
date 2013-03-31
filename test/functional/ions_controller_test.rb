require 'test_helper'

class IonsControllerTest < ActionController::TestCase
  setup do
    @ion = ions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ion" do
    assert_difference('Ion.count') do
      post :create, ion: {  }
    end

    assert_redirected_to ion_path(assigns(:ion))
  end

  test "should show ion" do
    get :show, id: @ion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ion
    assert_response :success
  end

  test "should update ion" do
    put :update, id: @ion, ion: {  }
    assert_redirected_to ion_path(assigns(:ion))
  end

  test "should destroy ion" do
    assert_difference('Ion.count', -1) do
      delete :destroy, id: @ion
    end

    assert_redirected_to ions_path
  end
end
