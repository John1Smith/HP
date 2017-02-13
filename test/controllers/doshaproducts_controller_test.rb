require 'test_helper'

class DoshaproductsControllerTest < ActionController::TestCase
  setup do
    @doshaproduct = doshaproducts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doshaproducts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doshaproduct" do
    assert_difference('Doshaproduct.count') do
      post :create, doshaproduct: { dosha_id: @doshaproduct.dosha_id, product_id: @doshaproduct.product_id }
    end

    assert_redirected_to doshaproduct_path(assigns(:doshaproduct))
  end

  test "should show doshaproduct" do
    get :show, id: @doshaproduct
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doshaproduct
    assert_response :success
  end

  test "should update doshaproduct" do
    patch :update, id: @doshaproduct, doshaproduct: { dosha_id: @doshaproduct.dosha_id, product_id: @doshaproduct.product_id }
    assert_redirected_to doshaproduct_path(assigns(:doshaproduct))
  end

  test "should destroy doshaproduct" do
    assert_difference('Doshaproduct.count', -1) do
      delete :destroy, id: @doshaproduct
    end

    assert_redirected_to doshaproducts_path
  end
end
