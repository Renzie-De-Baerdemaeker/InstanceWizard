require "test_helper"

class BrandingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get branding_index_url
    assert_response :success
  end
end
