require 'test_helper'

class ChatroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get chatrooms_home_url
    assert_response :success
  end

end
