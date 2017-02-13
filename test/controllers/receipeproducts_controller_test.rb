require 'test_helper'

class ReceipeproductsControllerTest < ActionController::TestCase
  setup do
    @receipeproduct = receipeproducts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receipeproducts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receipeproduct" do
    assert_difference('Receipeproduct.count') do
      post :create, receipeproduct: { product_id: @receipeproduct.product_id, quantity: @receipeproduct.quantity, receipe_id: @receipeproduct.receipe_id }
    end

    assert_redirected_to receipeproduct_path(assigns(:receipeproduct))
  end

  test "should show receipeproduct" do
    get :show, id: @receipeproduct
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receipeproduct
    assert_response :success
  end

  test "should update receipeproduct" do
    patch :update, id: @receipeproduct, receipeproduct: { product_id: @receipeproduct.product_id, quantity: @receipeproduct.quantity, receipe_id: @receipeproduct.receipe_id }
    assert_redirected_to receipeproduct_path(assigns(:receipeproduct))
  end

  test "should destroy receipeproduct" do
    assert_difference('Receipeproduct.count', -1) do
      delete :destroy, id: @receipeproduct
    end

    assert_redirected_to receipeproducts_path
  end
end
