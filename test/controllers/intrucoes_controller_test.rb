require "test_helper"

class IntrucoesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get intrucoes_index_url
    assert_response :success
  end
end
