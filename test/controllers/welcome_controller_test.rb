require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get showName" do
    get welcome_showName_url
    assert_response :success
  end

end
