class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @posts = Post.order(id: :desc)
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "posted!"
      redirect_to :root
    else
      render "new"
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(salable_params)
      change_status(@post)
      flash[:notice] = "Status update!"
      redirect_to :root
    else
      render "edit"
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :comment).merge(user_id: current_user.id)
  end
  
  def salable_params
    params.require(:post).permit(:stock, :price)
  end
  
  def change_status(post)
    if (post.stock > 0) && (post.price > 0) 
      post.update_attribute(:status, 1)
    else
      post.update_attribute(:status, 0)
    end
  end
end
