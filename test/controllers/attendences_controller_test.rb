require "test_helper"

class AttendencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attendence = attendences(:one)
  end

  test "should get index" do
    get attendences_url, as: :json
    assert_response :success
  end

  test "should create attendence" do
    assert_difference('Attendence.count') do
      post attendences_url, params: { attendence: { note: @attendence.note, session_id: @attendence.session_id, user_id: @attendence.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show attendence" do
    get attendence_url(@attendence), as: :json
    assert_response :success
  end

  test "should update attendence" do
    patch attendence_url(@attendence), params: { attendence: { note: @attendence.note, session_id: @attendence.session_id, user_id: @attendence.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy attendence" do
    assert_difference('Attendence.count', -1) do
      delete attendence_url(@attendence), as: :json
    end

    assert_response 204
  end
end
