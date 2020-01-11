require 'test_helper'

class RayonControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get rayon_home_url
    assert_response :success
  end

end
