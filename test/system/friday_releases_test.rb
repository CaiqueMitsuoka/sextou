require "application_system_test_case"

class FridayReleasesTest < ApplicationSystemTestCase
  setup do
    @friday_release = friday_releases(:one)
  end

  test "visiting the index" do
    visit friday_releases_url
    assert_selector "h1", text: "Friday Releases"
  end

  test "creating a Friday release" do
    visit friday_releases_url
    click_on "New Friday Release"

    fill_in "Playlist", with: @friday_release.playlist_id
    fill_in "User", with: @friday_release.user_id
    click_on "Create Friday release"

    assert_text "Friday release was successfully created"
    click_on "Back"
  end

  test "updating a Friday release" do
    visit friday_releases_url
    click_on "Edit", match: :first

    fill_in "Playlist", with: @friday_release.playlist_id
    fill_in "User", with: @friday_release.user_id
    click_on "Update Friday release"

    assert_text "Friday release was successfully updated"
    click_on "Back"
  end

  test "destroying a Friday release" do
    visit friday_releases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Friday release was successfully destroyed"
  end
end
