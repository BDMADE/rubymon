require 'test_helper'

class TypesControllerTest < ActionController::TestCase
  setup do
    @type = types(:one)
    @user = users(:one)
  end

  test "should get index" do
    log_in_as(@user)
    get :index
    assert_response :success
    assert_not_nil assigns(:types)
  end

  test "should get new" do
    log_in_as(@user)
    get :new
    assert_response :success
  end

  test "should create type" do
    log_in_as(@user)
    assert_difference('Type.count') do
      post :create, type: { name: @type.name, power: @type.power }
    end

    assert_redirected_to type_path(assigns(:type))
  end

  test "should show type" do
    log_in_as(@user)
    get :show, id: @type
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get :edit, id: @type
    assert_response :success
  end

  test "should update type" do
    log_in_as(@user)
    patch :update, id: @type, type: { name: @type.name, power: @type.power }
    assert_redirected_to type_path(assigns(:type))
  end

  test "should destroy type" do
    log_in_as(@user)
    assert_difference('Type.count', -1) do
      delete :destroy, id: @type
    end

    assert_redirected_to types_path
  end
end
