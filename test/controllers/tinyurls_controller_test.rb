require 'test_helper'

class TinyurlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tinyurl = tinyurls(:one)
  end

  test "should get index" do
    get tinyurls_url
    assert_response :success
  end

  test "should get new" do
    get new_tinyurl_url
    assert_response :success
  end

  test "should create tinyurl" do
    assert_difference('Tinyurl.count') do
      post tinyurls_url, params: { tinyurl: { expiration: @tinyurl.expiration, original_url: @tinyurl.original_url, tiny_url: @tinyurl.tiny_url } }
    end

    assert_redirected_to tinyurl_url(Tinyurl.last)
  end

  test "should show tinyurl" do
    get tinyurl_url(@tinyurl)
    assert_response :success
  end

  test "should get edit" do
    get edit_tinyurl_url(@tinyurl)
    assert_response :success
  end

  test "should update tinyurl" do
    patch tinyurl_url(@tinyurl), params: { tinyurl: { expiration: @tinyurl.expiration, original_url: @tinyurl.original_url, tiny_url: @tinyurl.tiny_url } }
    assert_redirected_to tinyurl_url(@tinyurl)
  end

  test "should destroy tinyurl" do
    assert_difference('Tinyurl.count', -1) do
      delete tinyurl_url(@tinyurl)
    end

    assert_redirected_to tinyurls_url
  end
end
