class UserMailer < ApplicationMailer
 default from: "from@example.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def delete_notification

    @greeting = "Hi"

  mail to: "seekle.info@gmail.com",subject:"ユーザー退会した！"
      
end


end
