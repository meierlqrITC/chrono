require "application_system_test_case"

class TerminsTest < ApplicationSystemTestCase
  setup do
    @termin = termins(:one)
  end

  test "visiting the index" do
    visit termins_url
    assert_selector "h1", text: "Termins"
  end

  test "should create termin" do
    visit termins_url
    click_on "New termin"

    fill_in "Beginn", with: @termin.beginn
    fill_in "Beschreibung", with: @termin.beschreibung
    fill_in "Bezeichnung", with: @termin.bezeichnung
    fill_in "Ende", with: @termin.ende
    fill_in "Veranstaltung", with: @termin.veranstaltung_id
    click_on "Create Termin"

    assert_text "Termin was successfully created"
    click_on "Back"
  end

  test "should update Termin" do
    visit termin_url(@termin)
    click_on "Edit this termin", match: :first

    fill_in "Beginn", with: @termin.beginn
    fill_in "Beschreibung", with: @termin.beschreibung
    fill_in "Bezeichnung", with: @termin.bezeichnung
    fill_in "Ende", with: @termin.ende
    fill_in "Veranstaltung", with: @termin.veranstaltung_id
    click_on "Update Termin"

    assert_text "Termin was successfully updated"
    click_on "Back"
  end

  test "should destroy Termin" do
    visit termin_url(@termin)
    click_on "Destroy this termin", match: :first

    assert_text "Termin was successfully destroyed"
  end
end
