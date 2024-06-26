require "test_helper"

class AnwesenheitslistesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anwesenheitsliste = anwesenheitslistes(:one)
  end

  test "should get index" do
    get anwesenheitslistes_url
    assert_response :success
  end

  test "should get new" do
    get new_anwesenheitsliste_url
    assert_response :success
  end

  test "should create anwesenheitsliste" do
    assert_difference("Anwesenheitsliste.count") do
      post anwesenheitslistes_url, params: { anwesenheitsliste: { datum: @anwesenheitsliste.datum, veranstaltung_id: @anwesenheitsliste.veranstaltung_id } }
    end

    assert_redirected_to anwesenheitsliste_url(Anwesenheitsliste.last)
  end

  test "should show anwesenheitsliste" do
    get anwesenheitsliste_url(@anwesenheitsliste)
    assert_response :success
  end

  test "should get edit" do
    get edit_anwesenheitsliste_url(@anwesenheitsliste)
    assert_response :success
  end

  test "should update anwesenheitsliste" do
    patch anwesenheitsliste_url(@anwesenheitsliste), params: { anwesenheitsliste: { datum: @anwesenheitsliste.datum, veranstaltung_id: @anwesenheitsliste.veranstaltung_id } }
    assert_redirected_to anwesenheitsliste_url(@anwesenheitsliste)
  end

  test "should destroy anwesenheitsliste" do
    assert_difference("Anwesenheitsliste.count", -1) do
      delete anwesenheitsliste_url(@anwesenheitsliste)
    end

    assert_redirected_to anwesenheitslistes_url
  end
end
