require 'test_helper'

class PollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poll = polls(:one)
  end

  test "should get index" do
    get polls_url
    assert_response :success
  end

  test "should get new" do
    get new_poll_url
    assert_response :success
  end

  test "should create poll" do
    assert_difference('Poll.count') do
      post polls_url, params: { poll: { option1: @poll.option1, option2: @poll.option2, option3: @poll.option3, option4: @poll.option4, option5: @poll.option5, option6: @poll.option6, title: @poll.title, user_id: @poll.user_id } }
    end

    assert_redirected_to poll_url(Poll.last)
  end

  test "should show poll" do
    get poll_url(@poll)
    assert_response :success
  end

  test "should get edit" do
    get edit_poll_url(@poll)
    assert_response :success
  end

  test "should update poll" do
    patch poll_url(@poll), params: { poll: { option1: @poll.option1, option2: @poll.option2, option3: @poll.option3, option4: @poll.option4, option5: @poll.option5, option6: @poll.option6, title: @poll.title, user_id: @poll.user_id } }
    assert_redirected_to poll_url(@poll)
  end

  test "should destroy poll" do
    assert_difference('Poll.count', -1) do
      delete poll_url(@poll)
    end

    assert_redirected_to polls_url
  end
end
