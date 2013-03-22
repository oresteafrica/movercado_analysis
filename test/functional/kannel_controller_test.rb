require 'test_helper'

class KannelControllerTest < ActionController::TestCase
  test "should get entry_point" do
    get :entry_point
    assert_response :success
  end

end
