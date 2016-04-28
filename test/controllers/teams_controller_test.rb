require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  setup do
    @team = teams(:one)
    @user = users(:one)
  end

  test "should get index" do
    log_in_as(@user)
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "should get new" do
    log_in_as(@user)
    get :new
    assert_response :success
  end

  test "should create team" do
    log_in_as(@user)
    assert_difference('Team.count') do
      post :create, team: { name: @team.name, user_id: @team.user_id }
    end

    assert_redirected_to team_path(assigns(:team))
  end

  test "should show team" do
    log_in_as(@user)
    get :show, id: @team
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get :edit, id: @team
    assert_response :success
  end

  test "should update team" do
    log_in_as(@user)
    patch :update, id: @team, team: { name: @team.name, user_id: @team.user_id }
    assert_redirected_to team_path(assigns(:team))
  end

  test "should destroy team" do
    log_in_as(@user)
    assert_difference('Team.count', -1) do
      delete :destroy, id: @team
    end

    assert_redirected_to teams_path
  end
end
