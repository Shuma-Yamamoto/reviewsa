require "test_helper"

class ReviewThanksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get review_thanks_index_url
    assert_response :success
  end
end
