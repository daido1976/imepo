class WorstsController < ApplicationController
  def create
    @worst = Worst.create(user_id: current_user.id, post_id: params[:post_id])
    flash[:notice] = "voted 最悪!!!"
    redirect_to :root
  end
  
  def destroy
    worst = Worst.find_by(user_id: current_user.id, post_id: params[:post_id])
    worst.destroy
    flash[:notice] = "deleted 最悪..."
    redirect_to :root
  end
end
