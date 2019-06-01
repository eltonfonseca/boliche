require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  
  test 'se o usuario tiver logado' do
    sign_in users(:one)
    get :index
    assert_response :success
  end

  test 'se o usuario não tiver logado' do 
    get :index
    assert_response :redirect
  end

end
