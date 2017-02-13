require 'test_helper'

class CompositionproductsControllerTest < ActionController::TestCase
  setup do
    @compositionproduct = compositionproducts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compositionproducts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compositionproduct" do
    assert_difference('Compositionproduct.count') do
      post :create, compositionproduct: { compositon_id: @compositionproduct.compositon_id, product_id: @compositionproduct.product_id }
    end

    assert_redirected_to compositionproduct_path(assigns(:compositionproduct))
  end

  test "should show compositionproduct" do
    get :show, id: @compositionproduct
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compositionproduct
    assert_response :success
  end

  test "should update compositionproduct" do
    patch :update, id: @compositionproduct, compositionproduct: { compositon_id: @compositionproduct.compositon_id, product_id: @compositionproduct.product_id }
    assert_redirected_to compositionproduct_path(assigns(:compositionproduct))
  end

  test "should destroy compositionproduct" do
    assert_difference('Compositionproduct.count', -1) do
      delete :destroy, id: @compositionproduct
    end

    assert_redirected_to compositionproducts_path
  end
end
