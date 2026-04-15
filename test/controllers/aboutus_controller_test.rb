require "test_helper"

class AboutusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aboutus_index_url
    assert_response :success
  end
end
