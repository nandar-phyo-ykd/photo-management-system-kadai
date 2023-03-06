require "test_helper"

class PhotoListControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get photo_list_top_url
    assert_response :success
  end
end
