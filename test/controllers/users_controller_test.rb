require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get full_name" do
    get users_full_name_url
    assert_response :success
  end

end
