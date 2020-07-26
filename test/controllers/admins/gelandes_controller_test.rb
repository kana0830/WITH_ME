require 'test_helper'

class Admins::GelandesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_gelandes_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_gelandes_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_gelandes_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_gelandes_edit_url
    assert_response :success
  end

end
