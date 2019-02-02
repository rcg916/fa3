require 'test_helper'

class PhotoupvotesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get photoupvotes_update_url
    assert_response :success
  end

end
