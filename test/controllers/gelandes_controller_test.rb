require 'test_helper'

class GelandesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gelandes_index_url
    assert_response :success
  end

  test "should get show" do
    get gelandes_show_url
    assert_response :success
  end

end
