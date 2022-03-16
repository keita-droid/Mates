require 'test_helper'

class Helps::PoliciesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get helps_policies_show_url
    assert_response :success
  end

end
