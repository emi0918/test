class ReservationMailer < ApplicationMailer
 default from: "from@example.com"


#provider側に予約が来たよのメールを送信
  def reservation_email(provider, reservation)
  	 @provider = provider
      @title = reservation.note.title
      @date = reservation.date
      @name= reservation.name
      @message=reservation.message
    mail to:  reservation.note.provider.email, subject: "【Seekle】掲載中のサービスに予約が来ています！"
  end


#user側に予約完了確認のメールを送信
  def myreservation_email(user, reservation)
  	 @provider = reservation.note.provider.name
      @title = reservation.note.title
      @date = reservation.date
      @name= reservation.name
      @message=reservation.message
    mail to:  reservation.user.email, subject: "【Seekle】仮予約が完了しました！(予約内容確認)"
  end


end
