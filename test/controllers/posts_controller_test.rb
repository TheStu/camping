require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { category: @post.category, content: @post.content, large_image_url: @post.large_image_url, meta_desc: @post.meta_desc, meta_title: @post.meta_title, thumb_image_url: @post.thumb_image_url, thumbs_down: @post.thumbs_down, thumbs_up: @post.thumbs_up, title: @post.title }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { category: @post.category, content: @post.content, large_image_url: @post.large_image_url, meta_desc: @post.meta_desc, meta_title: @post.meta_title, thumb_image_url: @post.thumb_image_url, thumbs_down: @post.thumbs_down, thumbs_up: @post.thumbs_up, title: @post.title }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
