require "test_helper"

class NewsletterControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get newsletter_create_url
    assert_response :success
  end
end
