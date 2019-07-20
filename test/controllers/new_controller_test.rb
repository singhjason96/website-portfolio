require 'test_helper'

class NewControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get new_show_url
    assert_response :success
  end

  test "should get creare" do
    get new_creare_url
    assert_response :success
  end

end
