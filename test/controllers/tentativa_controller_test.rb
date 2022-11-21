require "test_helper"

class TentativaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tentativa_index_url
    assert_response :success
  end
end
