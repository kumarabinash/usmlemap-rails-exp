require 'test_helper'

class MarkersControllerTest < ActionController::TestCase
  setup do
    @marker = markers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:markers)
  end

  test "should get new" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
    sign_in users(:kumar)
    get :new
    assert_response :success
  end

  test "should be logged in to post a marker" do
    post :create, marker: { marker_content: "hello"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create marker when logged in " do
    sign_in users(:kumar)
    assert_difference('Marker.count') do
      post :create, marker: { lat: @marker.lat, lng: @marker.lng, marker_content: @marker.marker_content, marker_type: @marker.marker_type }
    end

    assert_redirected_to marker_path(assigns(:marker))
  end

  test "should show marker" do
    get :show, id: @marker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @marker
    assert_response :success
  end

  test "should update marker" do
    patch :update, id: @marker, marker: { lat: @marker.lat, lng: @marker.lng, marker_content: @marker.marker_content, marker_type: @marker.marker_type }
    assert_redirected_to marker_path(assigns(:marker))
  end

  test "should destroy marker" do
    assert_difference('Marker.count', -1) do
      delete :destroy, id: @marker
    end

    assert_redirected_to markers_path
  end
end
