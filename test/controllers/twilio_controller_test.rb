require 'test_helper'

class TwilioControllerTest < ActionController::TestCase
  test "should get text" do
    get :text
    assert_response :success
  end

end
