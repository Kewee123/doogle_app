require "test_helper"

class HomePageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_page_home_url
    assert_response :success
    assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
  end
end
