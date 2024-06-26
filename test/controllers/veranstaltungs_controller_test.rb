require "test_helper"

class VeranstaltungsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @veranstaltung = veranstaltungs(:one)
  end

  test "should get index" do
    get veranstaltungs_url
    assert_response :success
  end

  test "should get new" do
    get new_veranstaltung_url
    assert_response :success
  end

  test "should create veranstaltung" do
    assert_difference("Veranstaltung.count") do
      post veranstaltungs_url, params: { veranstaltung: { beschreibung: @veranstaltung.beschreibung, datum: @veranstaltung.datum, modul_id: @veranstaltung.modul_id, name: @veranstaltung.name } }
    end

    assert_redirected_to veranstaltung_url(Veranstaltung.last)
  end

  test "should show veranstaltung" do
    get veranstaltung_url(@veranstaltung)
    assert_response :success
  end

  test "should get edit" do
    get edit_veranstaltung_url(@veranstaltung)
    assert_response :success
  end

  test "should update veranstaltung" do
    patch veranstaltung_url(@veranstaltung), params: { veranstaltung: { beschreibung: @veranstaltung.beschreibung, datum: @veranstaltung.datum, modul_id: @veranstaltung.modul_id, name: @veranstaltung.name } }
    assert_redirected_to veranstaltung_url(@veranstaltung)
  end

  test "should destroy veranstaltung" do
    assert_difference("Veranstaltung.count", -1) do
      delete veranstaltung_url(@veranstaltung)
    end

    assert_redirected_to veranstaltungs_url
  end
end
