require 'test_helper'

class DoshasControllerTest < ActionController::TestCase
  setup do
    @dosha = doshas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doshas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dosha" do
    assert_difference('Dosha.count') do
      post :create, dosha: { desc: @dosha.desc, name: @dosha.name }
    end

    assert_redirected_to dosha_path(assigns(:dosha))
  end

  test "should show dosha" do
    get :show, id: @dosha
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dosha
    assert_response :success
  end

  test "should update dosha" do
    patch :update, id: @dosha, dosha: { desc: @dosha.desc, name: @dosha.name }
    assert_redirected_to dosha_path(assigns(:dosha))
  end

  test "should destroy dosha" do
    assert_difference('Dosha.count', -1) do
      delete :destroy, id: @dosha
    end

    assert_redirected_to doshas_path
  end
end
