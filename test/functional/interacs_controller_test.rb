require 'test_helper'

class InteracsControllerTest < ActionController::TestCase
  setup do
    @interac = interacs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interacs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interac" do
    assert_difference('Interac.count') do
      post :create, interac: {  }
    end

    assert_redirected_to interac_path(assigns(:interac))
  end

  test "should show interac" do
    get :show, id: @interac
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interac
    assert_response :success
  end

  test "should update interac" do
    put :update, id: @interac, interac: {  }
    assert_redirected_to interac_path(assigns(:interac))
  end

  test "should destroy interac" do
    assert_difference('Interac.count', -1) do
      delete :destroy, id: @interac
    end

    assert_redirected_to interacs_path
  end
end
