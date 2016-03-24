class NoticeMailer < ActionMailer::Base
  default from: "seekle.info@gmail.com"


 def sendmail_confirm(user)
    @user = user

    mail to: user.email, subject: "【Seekle】ご登録頂き、ありがとうございます"
  end
end



