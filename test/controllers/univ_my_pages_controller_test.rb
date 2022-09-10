require "test_helper"

class UnivMyPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get univ_my_pages_show_url
    assert_response :success
  end
end
