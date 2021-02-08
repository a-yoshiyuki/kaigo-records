require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get exit" do
    get session_exit_url
    assert_response :success
  end

end
