require "application_system_test_case"

class ModulsTest < ApplicationSystemTestCase
  setup do
    @modul = moduls(:one)
  end

  test "visiting the index" do
    visit moduls_url
    assert_selector "h1", text: "Moduls"
  end

  test "should create modul" do
    visit moduls_url
    click_on "New modul"

    fill_in "Beschreibung", with: @modul.beschreibung
    fill_in "Name", with: @modul.name
    click_on "Create Modul"

    assert_text "Modul angelegt"
    click_on "Back"
  end

  test "should update Modul" do
    visit modul_url(@modul)
    click_on "Edit this modul", match: :first

    fill_in "Beschreibung", with: @modul.beschreibung
    fill_in "Name", with: @modul.name
    click_on "Update Modul"

    assert_text "Modul was successfully updated"
    click_on "Back"
  end

  test "should destroy Modul" do
    visit modul_url(@modul)
    click_on "Destroy this modul", match: :first

    assert_text "Modul was successfully destroyed"
  end
end
