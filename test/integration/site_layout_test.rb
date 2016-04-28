require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test 'layout links' do
    get root_path
    assert_template 'home/index'
    assert_select 'a[href=?]', root_path, count: 1
    assert_select 'a[href=?]', login_path
    assert_select 'a[href=?]', signup_path
  end


  test 'admin layout link' do
    log_in_as(@user)
    get admin_path
    assert_template 'home/admin'
    assert_select 'a[href=?]',admin_path, count: 1
    assert_select 'a[href=?]',users_path
    assert_select 'a[href=?]',monsters_path
    assert_select 'a[href=?]',teams_path
    assert_select 'a[href=?]',types_path
    assert_select 'a[href=?]',user_path(id:@user)
    assert_select 'a[href=?]',edit_user_path(id:@user)
    assert_select 'a[href=?]',logout_path

  end

end