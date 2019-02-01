require 'test_helper'

class FavoritestoresControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get favoritestores_update_url
    assert_response :success
  end

end
