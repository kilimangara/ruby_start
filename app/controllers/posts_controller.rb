
class PostsController < ApplicationController

  def index
    @posts = Post.order('updated_at DESC').all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      # render the form again
    end
  end

  def edit
    @post = Post.where(id: params[:id]).first
  end

  def update
    @post = Post.where(id: params[:id]).first
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      #render form again
    end
  end

  def destroy
    @post = Post.where(id: params[:id]).first
    if @post.destroy
      redirect_to posts_path
    else
      #smth
    end
  end

  def show
    @post = Post.where(id: params[:id]).first
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :tag_ids => [])
  end

end
