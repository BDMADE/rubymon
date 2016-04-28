require 'test_helper'

class HomeControllerTest < ActionController::TestCase

def setup
    @user       = users(:one)
    @other_user = users(:two)
end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get admin" do
  	log_in_as(@user)
    get :admin
    assert_response :success
  end

end
