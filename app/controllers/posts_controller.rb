class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!, except: [:show, :index, :feed]
  load_and_authorize_resource except: :feed

  def feed
    @posts = Post.all.order('published_at DESC')
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post.update(view_count: @post.view_count + 1)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params.merge(user: current_user))

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
      redirect_to action: action_name, id: @post.friendly_id, status: 301 unless @post.friendly_id == params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :title, :thumbs_up, :thumbs_down, :large_image_url, :thumb_image_url, :meta_title, :meta_desc, :category, :user_id)
    end
end
