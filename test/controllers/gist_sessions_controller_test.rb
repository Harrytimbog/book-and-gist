require 'test_helper'

class GistSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gist_sessions_index_url
    assert_response :success
  end

  test "should get show" do
    get gist_sessions_show_url
    assert_response :success
  end

  test "should get new" do
    get gist_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get gist_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get gist_sessions_destroy_url
    assert_response :success
  end

end
