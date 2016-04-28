require 'test_helper'

class MonstersControllerTest < ActionController::TestCase
  setup do
    @monster = monsters(:one)
    @user = users(:one)
  end

  test "should get index" do
    log_in_as(@user)
    get :index
    assert_response :success
    assert_not_nil assigns(:monsters)
  end

  test "should get new" do
    log_in_as(@user)
    get :new
    assert_response :success
  end

  test "should create monster" do
    log_in_as(@user)
    assert_difference('Monster.count') do
      post :create, monster: {name: @monster.name, team_id: @monster.team_id, type_id: @monster.type_id, user_id: @monster.user_id}
    end

    assert_redirected_to monster_path(assigns(:monster))
  end

  test "should show monster" do
    log_in_as(@user)
    get :show, id: @monster
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get :edit, id: @monster
    assert_response :success
  end

  test "should update monster" do
    log_in_as(@user)
    patch :update, id: @monster, monster: {name: @monster.name, team_id: @monster.team_id, type_id: @monster.type_id, user_id: @monster.user_id}
    assert_redirected_to monster_path(assigns(:monster))
  end

  test "should destroy monster" do
    log_in_as(@user)
    assert_difference('Monster.count', -1) do
      delete :destroy, id: @monster
    end

    assert_redirected_to monsters_path
  end
end
