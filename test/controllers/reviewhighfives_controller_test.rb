require 'test_helper'

class ReviewhighfivesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get reviewhighfives_update_url
    assert_response :success
  end

end
