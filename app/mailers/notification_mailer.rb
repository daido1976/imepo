class NotificationMailer < ApplicationMailer
  def send_when_salable(user, post)
    @user = user
    @post = post
    mail to: @user.email, subject: "あなたの投稿した画像が販売可能になりました！"
  end
end
