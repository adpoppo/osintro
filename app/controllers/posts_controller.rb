class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @posts = Post.all.page(params[:page]).reverse_order.per(9)
  end

  def new
    @post_form = PostForm.new
  end

  def create
    @post_form = PostForm.new(post_form_params)
    if @post_form.valid?
      @post_form.save
      redirect_to root_path
    else
      render :new
    end 
  end

  def show
    @comment = Comment.new
  end

  def edit
    post_attributes = @post.attributes
    @post_form = PostForm.new(post_attributes)
    @post_form.tag_name = @post.tags&.first&.tag_name
  end

  def update
    @post_form = PostForm.new(post_form_params)
    @post_form.post_images ||= @post.post_images.blobs
    if @post_form.valid?
      @post_form.update(post_form_params, @post)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end
  
  private

  def post_form_params
    params.require(:post_form).permit(:tag_name, {post_images: []}, :title, :content, :category_id, :link).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

end
