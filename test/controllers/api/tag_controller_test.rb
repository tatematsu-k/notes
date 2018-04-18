require 'test_helper'

class Api::TagControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get api_tag_search_url
    assert_response :success
  end

end
