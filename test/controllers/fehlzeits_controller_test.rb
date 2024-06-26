require "test_helper"

class FehlzeitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fehlzeit = fehlzeits(:one)
  end

  test "should get index" do
    get fehlzeits_url
    assert_response :success
  end

  test "should get new" do
    get new_fehlzeit_url
    assert_response :success
  end

  test "should create fehlzeit" do
    assert_difference("Fehlzeit.count") do
      post fehlzeits_url, params: { fehlzeit: { begründung: @fehlzeit.begründung, datum: @fehlzeit.datum, student_id: @fehlzeit.student_id, veranstaltung_id: @fehlzeit.veranstaltung_id } }
    end

    assert_redirected_to fehlzeit_url(Fehlzeit.last)
  end

  test "should show fehlzeit" do
    get fehlzeit_url(@fehlzeit)
    assert_response :success
  end

  test "should get edit" do
    get edit_fehlzeit_url(@fehlzeit)
    assert_response :success
  end

  test "should update fehlzeit" do
    patch fehlzeit_url(@fehlzeit), params: { fehlzeit: { begründung: @fehlzeit.begründung, datum: @fehlzeit.datum, student_id: @fehlzeit.student_id, veranstaltung_id: @fehlzeit.veranstaltung_id } }
    assert_redirected_to fehlzeit_url(@fehlzeit)
  end

  test "should destroy fehlzeit" do
    assert_difference("Fehlzeit.count", -1) do
      delete fehlzeit_url(@fehlzeit)
    end

    assert_redirected_to fehlzeits_url
  end
end
