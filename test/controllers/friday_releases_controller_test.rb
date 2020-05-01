require 'test_helper'

class FridayReleasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friday_release = friday_releases(:one)
  end

  test "should get index" do
    get friday_releases_url
    assert_response :success
  end

  test "should get new" do
    get new_friday_release_url
    assert_response :success
  end

  test "should create friday_release" do
    assert_difference('FridayRelease.count') do
      post friday_releases_url, params: { friday_release: { playlist_id: @friday_release.playlist_id, user_id: @friday_release.user_id } }
    end

    assert_redirected_to friday_release_url(FridayRelease.last)
  end

  test "should show friday_release" do
    get friday_release_url(@friday_release)
    assert_response :success
  end

  test "should get edit" do
    get edit_friday_release_url(@friday_release)
    assert_response :success
  end

  test "should update friday_release" do
    patch friday_release_url(@friday_release), params: { friday_release: { playlist_id: @friday_release.playlist_id, user_id: @friday_release.user_id } }
    assert_redirected_to friday_release_url(@friday_release)
  end

  test "should destroy friday_release" do
    assert_difference('FridayRelease.count', -1) do
      delete friday_release_url(@friday_release)
    end

    assert_redirected_to friday_releases_url
  end
end
