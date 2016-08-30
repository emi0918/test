class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_note ,except:[:list]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all

    @notes = current_provider.notes.all.page(params[:page]).per(3).order(:id)
    render :layout => 'providers_layout.html'
  end


def list
   @reservations = Reservation.includes(:note).all

end
  # GET /reservations/1
  # GET /reservations/1.json
  def show

  end

def detail
  @reservations = Reservation.all
  
end
  # GET /reservations/new
  def new
    
    @reservation = Reservation.new
   authenticate_user!

    @times = ["いつでも良い" ,"07:00","08:00","09:00", "10:00", "11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","特に決まっていない"]
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    @reservation.user_id = current_user.id
    @reservation.note_id = @note.id
    

    recipients = @note.provider
    confirm_subject= "予約が来ました！"

    confirm_message= 
    "
     希望日程は#{reservation_params[:date]}で、#{reservation_params[:name]}さんからご予約が来ました。
    -------------------------------------------------------------------------------------------
     お問い合わせ内容：

      #{reservation_params[:message]}"


conversation = current_user.send_message(recipients, confirm_message, confirm_subject).conversation 



    if params[:back]          
      render :new
    elsif @reservation.save
     redirect_to complete_note_reservations_path
      ReservationMailer.reservation_email(@provider, @reservation).deliver
      ReservationMailer.myreservation_email(@user, @reservation).deliver
   else
     render :new 
   end
 end

 
def confirm
  @reservation = Reservation.new(reservation_params) # <=POSTされたパラメータを取得
  render :new if @reservation.invalid? # <=バリデーションチェックNGなら戻す  
end

  def complete
    @reservations = Reservation.all
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    if @reservation.update(reservation_params)
     redirect_to @reservation
   else
     render :edit 
   end
 end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    redirect_to reservations_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def set_note
      @note = Note.find(params[:note_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:date, :name,:phone_number,:message,:note_id)
      



    end
  end
