require "application_system_test_case"

class VeranstaltungsTest < ApplicationSystemTestCase
  setup do
    @veranstaltung = veranstaltungs(:one)
  end

  test "visiting the index" do
    visit veranstaltungs_url
    assert_selector "h1", text: "Veranstaltungs"
  end

  test "should create veranstaltung" do
    visit veranstaltungs_url
    click_on "New veranstaltung"

    fill_in "Beschreibung", with: @veranstaltung.beschreibung
    fill_in "Datum", with: @veranstaltung.datum
    fill_in "Modul", with: @veranstaltung.modul_id
    fill_in "Name", with: @veranstaltung.name
    click_on "Create Veranstaltung"

    assert_text "Veranstaltung erfolgreich erstellt"
    click_on "Back"
  end

  test "should update Veranstaltung" do
    visit veranstaltung_url(@veranstaltung)
    click_on "Edit this veranstaltung", match: :first

    fill_in "Beschreibung", with: @veranstaltung.beschreibung
    fill_in "Datum", with: @veranstaltung.datum
    fill_in "Modul", with: @veranstaltung.modul_id
    fill_in "Name", with: @veranstaltung.name
    click_on "Update Veranstaltung"

    assert_text "Veranstaltung was successfully updated"
    click_on "Back"
  end

  test "should destroy Veranstaltung" do
    visit veranstaltung_url(@veranstaltung)
    click_on "Destroy this veranstaltung", match: :first

    assert_text "Veranstaltung was successfully destroyed"
  end
end
