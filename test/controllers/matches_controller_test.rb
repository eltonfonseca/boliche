require 'test_helper'

class MatchesControllerTest < ActionController::TestCase
  test 'se o usuario tiver logado' do
    sign_in users(:one)
    get :index
    assert_response :success
  end

  test 'se o usuario não tiver logado' do 
    get :index
    assert_response :redirect
  end

  test 'se não houver matches' do
    sign_in users(:one)
    get :index
    assert_nil nil
  end

  test 'se houver matches' do
    sign_in users(:one)
    get :index
    assert_not_nil JSON.parse(response.body)
  end
end
