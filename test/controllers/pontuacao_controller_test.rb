require "test_helper"

class PontuacaoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pontuacao_index_url
    assert_response :success
  end
end
