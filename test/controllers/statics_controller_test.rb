require 'test_helper'

class StaticsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get statics_top_url
    assert_response :success
  end

  test "should get about" do
    get statics_about_url
    assert_response :success
  end

  test "should get borrow" do
    get statics_borrow_url
    assert_response :success
  end

  test "should get lend" do
    get statics_lend_url
    assert_response :success
  end

end
