class NoticeMailer < ActionMailer::Base
  default from: "seekle.info@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def welcome_email(user)
    @greeting = "Hi"

     @user = current_user
     @url ="seekle.jp"
     mail(to: current_user.email, subject: '【Seekle】アカウント登録が完了しました。')
      format.html
  end
end




