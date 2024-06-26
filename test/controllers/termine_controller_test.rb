require "test_helper"

class TermineControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get termine_index_url
    assert_response :success
  end

  test "should get show" do
    get termine_show_url
    assert_response :success
  end

  test "should get new" do
    get termine_new_url
    assert_response :success
  end

  test "should get edit" do
    get termine_edit_url
    assert_response :success
  end

  test "should get create" do
    get termine_create_url
    assert_response :success
  end

  test "should get update" do
    get termine_update_url
    assert_response :success
  end

  test "should get destroy" do
    get termine_destroy_url
    assert_response :success
  end
end
