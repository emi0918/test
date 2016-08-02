class ReservationMailer < ApplicationMailer
 default from: "from@example.com"

  def reservation_email(provider, reservation)
  	 @provider = provider
      @title = reservation.note.title
      @date = reservation.date
      @name= reservation.name
      @message=reservation.message
    mail to:  reservation.note.provider.email, subject: "【Seekle】掲載中のサービスに予約が来ています！"
  end
end