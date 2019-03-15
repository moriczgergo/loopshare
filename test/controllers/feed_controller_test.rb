require 'test_helper'

class FeedControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get feed_create_url
    assert_response :success
  end

  test "should get new" do
    get feed_new_url
    assert_response :success
  end

end
