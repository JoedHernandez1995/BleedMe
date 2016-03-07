require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    @request = requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request" do
    assert_difference('Request.count') do
      post :create, request: { blood_type_needed: @request.blood_type_needed, blood_units_needed: @request.blood_units_needed, compatible_blood_types: @request.compatible_blood_types, date_needed: @request.date_needed, email: @request.email, message: @request.message, name: @request.name, needed_for: @request.needed_for, phone_number: @request.phone_number }
    end

    assert_redirected_to request_path(assigns(:request))
  end

  test "should show request" do
    get :show, id: @request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request
    assert_response :success
  end

  test "should update request" do
    patch :update, id: @request, request: { blood_type_needed: @request.blood_type_needed, blood_units_needed: @request.blood_units_needed, compatible_blood_types: @request.compatible_blood_types, date_needed: @request.date_needed, email: @request.email, message: @request.message, name: @request.name, needed_for: @request.needed_for, phone_number: @request.phone_number }
    assert_redirected_to request_path(assigns(:request))
  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete :destroy, id: @request
    end

    assert_redirected_to requests_path
  end
end
