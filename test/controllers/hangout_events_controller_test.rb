require 'test_helper'

class HangoutEventsControllerTest < ActionController::TestCase
  setup do
    @hangout_event = hangout_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hangout_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hangout_event" do
    assert_difference('HangoutEvent.count') do
      post :create, hangout_event: { date: @hangout_event.date, endtime: @hangout_event.endtime, name: @hangout_event.name, start_time: @hangout_event.start_time }
    end

    assert_redirected_to hangout_event_path(assigns(:hangout_event))
  end

  test "should show hangout_event" do
    get :show, id: @hangout_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hangout_event
    assert_response :success
  end

  test "should update hangout_event" do
    patch :update, id: @hangout_event, hangout_event: { date: @hangout_event.date, endtime: @hangout_event.endtime, name: @hangout_event.name, start_time: @hangout_event.start_time }
    assert_redirected_to hangout_event_path(assigns(:hangout_event))
  end

  test "should destroy hangout_event" do
    assert_difference('HangoutEvent.count', -1) do
      delete :destroy, id: @hangout_event
    end

    assert_redirected_to hangout_events_path
  end
end
