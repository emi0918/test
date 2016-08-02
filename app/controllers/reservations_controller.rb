class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_note
 before_action :authenticate_user!
  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
    @note = Note.find(params[:note_id])
    @notes = current_provider.notes.all.page(params[:page]).per(3).order(:id)
    render :layout => 'providers_layout.html'
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
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