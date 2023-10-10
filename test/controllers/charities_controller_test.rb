require "test_helper"

class CharitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get apply" do
    get charities_apply_url
    assert_response :success
  end

  test "should get edit" do
    get charities_edit_url
    assert_response :success
  end

  test "should get update" do
    get charities_update_url
    assert_response :success
  end

  test "should get donors" do
    get charities_donors_url
    assert_response :success
  end

  test "should get donations" do
    get charities_donations_url
    assert_response :success
  end

  test "should get stories" do
    get charities_stories_url
    assert_response :success
  end

  test "should get beneficiaries" do
    get charities_beneficiaries_url
    assert_response :success
  end

  test "should get automated_donations" do
    get charities_automated_donations_url
    assert_response :success
  end
end
