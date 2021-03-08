require "test_helper"

class AssignementCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignement_category = assignement_categories(:one)
  end

  test "should get index" do
    get assignement_categories_url, as: :json
    assert_response :success
  end

  test "should create assignement_category" do
    assert_difference('AssignementCategory.count') do
      post assignement_categories_url, params: { assignement_category: { category_id: @assignement_category.category_id, formation_id: @assignement_category.formation_id } }, as: :json
    end

    assert_response 201
  end

  test "should show assignement_category" do
    get assignement_category_url(@assignement_category), as: :json
    assert_response :success
  end

  test "should update assignement_category" do
    patch assignement_category_url(@assignement_category), params: { assignement_category: { category_id: @assignement_category.category_id, formation_id: @assignement_category.formation_id } }, as: :json
    assert_response 200
  end

  test "should destroy assignement_category" do
    assert_difference('AssignementCategory.count', -1) do
      delete assignement_category_url(@assignement_category), as: :json
    end

    assert_response 204
  end
end
