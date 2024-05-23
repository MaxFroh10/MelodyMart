require "test_helper"

class InstrumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get category" do
    get instruments_category_url
    assert_response :success
  end

  test "should get name" do
    get instruments_name_url
    assert_response :success
  end

  test "should get description:text" do
    get instruments_description:text_url
    assert_response :success
  end

  test "should get price:float" do
    get instruments_price:float_url
    assert_response :success
  end

  test "should get user_id:references" do
    get instruments_user_id:references_url
    assert_response :success
  end

  test "should get picture" do
    get instruments_picture_url
    assert_response :success
  end
end
