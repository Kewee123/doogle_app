require "application_system_test_case"

class DefinitionsTest < ApplicationSystemTestCase
  setup do
    @definition = definitions(:one)
  end

  test "visiting the index" do
    visit definitions_url
    assert_selector "h1", text: "Definitions"
  end

  test "creating a Definition" do
    visit definitions_url
    click_on "New Definition"

    fill_in "Content", with: @definition.content
    fill_in "Word", with: @definition.word_id
    click_on "Create Definition"

    assert_text "Definition was successfully created"
    click_on "Back"
  end

  test "updating a Definition" do
    visit definitions_url
    click_on "Edit", match: :first

    fill_in "Content", with: @definition.content
    fill_in "Word", with: @definition.word_id
    click_on "Update Definition"

    assert_text "Definition was successfully updated"
    click_on "Back"
  end

  test "destroying a Definition" do
    visit definitions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Definition was successfully destroyed"
  end
end
