require 'test_helper'

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artists_index_url
    assert_response :success
  end

  test "should get show" do
    get artists_show_url
    assert_response :success
  end

  test "should get enfant" do
    get artists_enfant_url
    assert_response :success
  end

  test "should get spectacle" do
    get artists_spectacle_url
    assert_response :success
  end

  test "should get concert" do
    get artists_concert_url
    assert_response :success
  end

end
