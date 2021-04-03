require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Doogle App"
  end
  
  test "should get root" do
    get root_path
    assert_response :success
  end
end
