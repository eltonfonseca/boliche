require 'test_helper'

class JogadaControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get jogada_new_url
    assert_response :success
  end

end
