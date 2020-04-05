require "application_system_test_case"

class PartiesTest < ApplicationSystemTestCase
  setup do
    @party = parties(:one)
  end

  test "visiting the index" do
    visit parties_url
    assert_selector "h1", text: "Parties"
  end

  test "creating a Party" do
    visit parties_url
    click_on "New Party"

    fill_in "Name", with: @party.name
    fill_in "Slug", with: @party.slug
    fill_in "User", with: @party.user_id
    click_on "Create Party"

    assert_text "Party was successfully created"
    click_on "Back"
  end

  test "updating a Party" do
    visit parties_url
    click_on "Edit", match: :first

    fill_in "Name", with: @party.name
    fill_in "Slug", with: @party.slug
    fill_in "User", with: @party.user_id
    click_on "Update Party"

    assert_text "Party was successfully updated"
    click_on "Back"
  end

  test "destroying a Party" do
    visit parties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Party was successfully destroyed"
  end
end
