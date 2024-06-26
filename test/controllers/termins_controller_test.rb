require "test_helper"

class TerminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @termin = termins(:one)
  end

  test "should get index" do
    get termins_url
    assert_response :success
  end

  test "should get new" do
    get new_termin_url
    assert_response :success
  end

  test "should create termin" do
    assert_difference("Termin.count") do
      post termins_url, params: { termin: { beginn: @termin.beginn, beschreibung: @termin.beschreibung, bezeichnung: @termin.bezeichnung, ende: @termin.ende, veranstaltung_id: @termin.veranstaltung_id } }
    end

    assert_redirected_to termin_url(Termin.last)
  end

  test "should show termin" do
    get termin_url(@termin)
    assert_response :success
  end

  test "should get edit" do
    get edit_termin_url(@termin)
    assert_response :success
  end

  test "should update termin" do
    patch termin_url(@termin), params: { termin: { beginn: @termin.beginn, beschreibung: @termin.beschreibung, bezeichnung: @termin.bezeichnung, ende: @termin.ende, veranstaltung_id: @termin.veranstaltung_id } }
    assert_redirected_to termin_url(@termin)
  end

  test "should destroy termin" do
    assert_difference("Termin.count", -1) do
      delete termin_url(@termin)
    end

    assert_redirected_to termins_url
  end
end
