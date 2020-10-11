require 'test_helper'

class Api::V1::RatingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_ratings_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_ratings_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_ratings_update_url
    assert_response :success
  end

end
