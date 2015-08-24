require 'test_helper'

class MerchantCategoriesControllerTest < ActionController::TestCase
  setup do
    @merchant_category = merchant_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merchant_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merchant_category" do
    assert_difference('MerchantCategory.count') do
      post :create, merchant_category: { category_id: @merchant_category.category_id, matching_product_group_id: @merchant_category.matching_product_group_id, merchant_id: @merchant_category.merchant_id }
    end

    assert_redirected_to merchant_category_path(assigns(:merchant_category))
  end

  test "should show merchant_category" do
    get :show, id: @merchant_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merchant_category
    assert_response :success
  end

  test "should update merchant_category" do
    patch :update, id: @merchant_category, merchant_category: { category_id: @merchant_category.category_id, matching_product_group_id: @merchant_category.matching_product_group_id, merchant_id: @merchant_category.merchant_id }
    assert_redirected_to merchant_category_path(assigns(:merchant_category))
  end

  test "should destroy merchant_category" do
    assert_difference('MerchantCategory.count', -1) do
      delete :destroy, id: @merchant_category
    end

    assert_redirected_to merchant_categories_path
  end
end
