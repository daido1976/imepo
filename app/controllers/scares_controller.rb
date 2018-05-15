class ScaresController < ApplicationController
  def create
    @scare = Scare.create(user_id: current_user.id, post_id: params[:post_id])
    @post = Post.find(params[:post_id])
    if 10 == (@post.funs_count + @post.scares_count) - @post.worsts_count
      NotificationMailer.send_when_salable(@post.user, @post).deliver
    end
    flash[:notice] = "voted 怖い!!!"
    redirect_to :root
  end
  
  def destroy
    scare = Scare.find_by(user_id: current_user.id, post_id: params[:post_id])
    scare.destroy
    flash[:notice] = "deleted 怖い..."
    redirect_to :root
  end
end
