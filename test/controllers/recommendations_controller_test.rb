require "test_helper"

class RecommendationsControllerTest < ActionController::TestCase
  def recommendation
    @recommendation ||= recommendations :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:recommendations)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Recommendation.count") do
      post :create, recommendation: { feature_one: recommendation.feature_one, feature_three: recommendation.feature_three, feature_two: recommendation.feature_two, picture_url: recommendation.picture_url, title: recommendation.title, url: recommendation.url }
    end

    assert_redirected_to recommendation_path(assigns(:recommendation))
  end

  def test_show
    get :show, id: recommendation
    assert_response :success
  end

  def test_edit
    get :edit, id: recommendation
    assert_response :success
  end

  def test_update
    put :update, id: recommendation, recommendation: { feature_one: recommendation.feature_one, feature_three: recommendation.feature_three, feature_two: recommendation.feature_two, picture_url: recommendation.picture_url, title: recommendation.title, url: recommendation.url }
    assert_redirected_to recommendation_path(assigns(:recommendation))
  end

  def test_destroy
    assert_difference("Recommendation.count", -1) do
      delete :destroy, id: recommendation
    end

    assert_redirected_to recommendations_path
  end
end
