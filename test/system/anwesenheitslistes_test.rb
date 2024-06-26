require "application_system_test_case"

class AnwesenheitslistesTest < ApplicationSystemTestCase
  setup do
    @anwesenheitsliste = anwesenheitslistes(:one)
  end

  test "visiting the index" do
    visit anwesenheitslistes_url
    assert_selector "h1", text: "Anwesenheitslistes"
  end

  test "should create anwesenheitsliste" do
    visit anwesenheitslistes_url
    click_on "New anwesenheitsliste"

    fill_in "Datum", with: @anwesenheitsliste.datum
    fill_in "Veranstaltung", with: @anwesenheitsliste.veranstaltung_id
    click_on "Create Anwesenheitsliste"

    assert_text "Anwesenheitsliste was successfully created"
    click_on "Back"
  end

  test "should update Anwesenheitsliste" do
    visit anwesenheitsliste_url(@anwesenheitsliste)
    click_on "Edit this anwesenheitsliste", match: :first

    fill_in "Datum", with: @anwesenheitsliste.datum
    fill_in "Veranstaltung", with: @anwesenheitsliste.veranstaltung_id
    click_on "Update Anwesenheitsliste"

    assert_text "Anwesenheitsliste was successfully updated"
    click_on "Back"
  end

  test "should destroy Anwesenheitsliste" do
    visit anwesenheitsliste_url(@anwesenheitsliste)
    click_on "Destroy this anwesenheitsliste", match: :first

    assert_text "Anwesenheitsliste was successfully destroyed"
  end
end
