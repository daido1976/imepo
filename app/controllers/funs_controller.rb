class FunsController < ApplicationController
  def create
    @fun = Fun.create(user_id: current_user.id, post_id: params[:post_id])
    @post = Post.find(params[:post_id])
    if 10 == (@post.funs_count + @post.scares_count) - @post.worsts_count
      NotificationMailer.send_when_salable(@post.user, @post).deliver
    end
    flash[:notice] = "voted おもしろい!!!"
    redirect_to :root
  end
  
  def destroy
    fun = Fun.find_by(user_id: current_user.id, post_id: params[:post_id])
    fun.destroy
    flash[:notice] = "deleted おもしろい..."
    redirect_to :root
  end
end
