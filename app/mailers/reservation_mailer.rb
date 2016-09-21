class ReservationMailer < ApplicationMailer
 default from: "from@example.com"


#provider側に予約が来たよのメールを送信
  def reservation_email(provider, reservation)
  	 @provider = provider
   @workdate1 = reservation.workdate1
   @workdate2 = reservation.workdate2
   @workdate3 = reservation.workdate3
   @worktime1 = reservation.worktime1
   @worktime2 = reservation.worktime2
   @worktime3 = reservation.worktime3
  @reservations = Reservation.includes(:note).all
  @reservations = Reservation.includes(:note_revisions).all
@note= reservation.note
      @date = reservation.date
      @name= reservation.name
      @message=reservation.message
    mail to:  reservation.note.provider.email, subject: "【Seekle】掲載中のサービスに予約が来ています！"
  end


#user側に予約完了確認のメールを送信
  def myreservation_email(user, reservation)
  	 @provider = reservation.note.provider.name
       @workdate1 = reservation.workdate1
   @workdate2 = reservation.workdate2
   @workdate3 = reservation.workdate3
   @worktime1 = reservation.worktime1
   @worktime2 = reservation.worktime2
   @worktime3 = reservation.worktime3
@note= reservation.note
     @reservations = Reservation.includes(:note).all
     @reservations = Reservation.includes(:note_revisions).all

      @date = reservation.date
      @name= reservation.name
      @message=reservation.message
    mail to:  reservation.user.email, subject: "【Seekle】仮予約が完了しました！(予約内容確認)"

  end


  def mail_to_seekle(provider, reservation)
     @provider = reservation.note.provider.name
       @workdate1 = reservation.workdate1
   @workdate2 = reservation.workdate2
   @workdate3 = reservation.workdate3
   @worktime1 = reservation.worktime1
   @worktime2 = reservation.worktime2
   @worktime3 = reservation.worktime3
@note= reservation.note
     @reservations = Reservation.includes(:note).all
     @reservations = Reservation.includes(:note_revisions).all

      @date = reservation.date
      @name= reservation.name
      @message=reservation.message
    mail to: "emi.m0918@gmail.com", subject: "予約が来てる"
  end

end

