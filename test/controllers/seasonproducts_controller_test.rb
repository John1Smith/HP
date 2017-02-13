require 'test_helper'

class SeasonproductsControllerTest < ActionController::TestCase
  setup do
    @seasonproduct = seasonproducts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seasonproducts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seasonproduct" do
    assert_difference('Seasonproduct.count') do
      post :create, seasonproduct: { product_id: @seasonproduct.product_id, season_id: @seasonproduct.season_id }
    end

    assert_redirected_to seasonproduct_path(assigns(:seasonproduct))
  end

  test "should show seasonproduct" do
    get :show, id: @seasonproduct
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seasonproduct
    assert_response :success
  end

  test "should update seasonproduct" do
    patch :update, id: @seasonproduct, seasonproduct: { product_id: @seasonproduct.product_id, season_id: @seasonproduct.season_id }
    assert_redirected_to seasonproduct_path(assigns(:seasonproduct))
  end

  test "should destroy seasonproduct" do
    assert_difference('Seasonproduct.count', -1) do
      delete :destroy, id: @seasonproduct
    end

    assert_redirected_to seasonproducts_path
  end
end
