require "application_system_test_case"

class FehlzeitsTest < ApplicationSystemTestCase
  setup do
    @fehlzeit = fehlzeits(:one)
  end

  test "visiting the index" do
    visit fehlzeits_url
    assert_selector "h1", text: "Fehlzeits"
  end

  test "should create fehlzeit" do
    visit fehlzeits_url
    click_on "New fehlzeit"

    fill_in "Begründung", with: @fehlzeit.begründung
    fill_in "Datum", with: @fehlzeit.datum
    fill_in "Student", with: @fehlzeit.student_id
    fill_in "Veranstaltung", with: @fehlzeit.veranstaltung_id
    click_on "Create Fehlzeit"

    assert_text "Fehlzeit was successfully created"
    click_on "Back"
  end

  test "should update Fehlzeit" do
    visit fehlzeit_url(@fehlzeit)
    click_on "Edit this fehlzeit", match: :first

    fill_in "Begründung", with: @fehlzeit.begründung
    fill_in "Datum", with: @fehlzeit.datum
    fill_in "Student", with: @fehlzeit.student_id
    fill_in "Veranstaltung", with: @fehlzeit.veranstaltung_id
    click_on "Update Fehlzeit"

    assert_text "Fehlzeit was successfully updated"
    click_on "Back"
  end

  test "should destroy Fehlzeit" do
    visit fehlzeit_url(@fehlzeit)
    click_on "Destroy this fehlzeit", match: :first

    assert_text "Fehlzeit was successfully destroyed"
  end
end
