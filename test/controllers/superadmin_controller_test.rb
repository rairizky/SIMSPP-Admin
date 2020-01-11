require 'test_helper'

class SuperadminControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get superadmin_home_url
    assert_response :success
  end

end
