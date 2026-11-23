require "test_helper"

class AboutusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aboutus_url
    assert_response :success
  end
end
