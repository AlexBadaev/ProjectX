require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get im" do
    get :im
    assert_response :success
  end

end
