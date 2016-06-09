class UserMailer < ApplicationMailer
  default from: "seekle.info@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def welcome_email(user)
    @greeting = "Hi"

     @user = user
     @url ="seekle.jp"
     mail(to: @user.email, subject: '【Seekle】アカウント登録が完了しました。')
      format.html
  end
end


