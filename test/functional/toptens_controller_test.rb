require 'test_helper'

class ToptensControllerTest < ActionController::TestCase
  setup do
    @topten = toptens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:toptens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create topten" do
    assert_difference('Topten.count') do
      post :create, topten: {  }
    end

    assert_redirected_to topten_path(assigns(:topten))
  end

  test "should show topten" do
    get :show, id: @topten
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @topten
    assert_response :success
  end

  test "should update topten" do
    put :update, id: @topten, topten: {  }
    assert_redirected_to topten_path(assigns(:topten))
  end

  test "should destroy topten" do
    assert_difference('Topten.count', -1) do
      delete :destroy, id: @topten
    end

    assert_redirected_to toptens_path
  end
end
