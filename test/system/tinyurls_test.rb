require "application_system_test_case"

class TinyurlsTest < ApplicationSystemTestCase
  setup do
    @tinyurl = tinyurls(:one)
  end

  test "visiting the index" do
    visit tinyurls_url
    assert_selector "h1", text: "Tinyurls"
  end

  test "creating a Tinyurl" do
    visit tinyurls_url
    click_on "New Tinyurl"

    fill_in "Expiration", with: @tinyurl.expiration
    fill_in "Original url", with: @tinyurl.original_url
    fill_in "Tiny url", with: @tinyurl.tiny_url
    click_on "Create Tinyurl"

    assert_text "Tinyurl was successfully created"
    click_on "Back"
  end

  test "updating a Tinyurl" do
    visit tinyurls_url
    click_on "Edit", match: :first

    fill_in "Expiration", with: @tinyurl.expiration
    fill_in "Original url", with: @tinyurl.original_url
    fill_in "Tiny url", with: @tinyurl.tiny_url
    click_on "Update Tinyurl"

    assert_text "Tinyurl was successfully updated"
    click_on "Back"
  end

  test "destroying a Tinyurl" do
    visit tinyurls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tinyurl was successfully destroyed"
  end
end
