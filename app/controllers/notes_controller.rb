class NotesController < ApplicationController
   before_action :correct_user, only: [:edit, :update]
     before_action :set_note, only: [:show, :edit, :update, :destroy, :profile]
       before_action :authenticate_user!, only:[:profile]
include ApplicationHelper


  # GET /notes
  # GET /notes.json
  def index

    @notes = current_user.notes.all
  @notes = Note.includes(:user).page(params[:page]).per(3).order(:id)
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
   @notes = Note.includes(:users).all
   @note = Note.find(params[:id])
  end

  def search
   @notes = Note.includes(:user).page(params[:page]).per(6).order(:id)

  end

 def profile
    @notes = current_user.notes.all
 end

  # GET /notes/ne

  def new
   @note = Note.new
  end

  # GET /notes/1/sedit
  def edit
    @note = Note.find(params[:id])
    correct_user
  end



  # POST /notes
  # POST /notes.json
    def create
    @note = current_user.notes.build(note_params)

     file=params[:note][:image_1]
    @note.set_image_1(file)
    @note.user_id = current_user.id
   if @note.save
       redirect_to @note
#redirect_to @note で作成されたものが表示される
      else
         render :new
      end
    end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    correct_user
        @note = Note.find(params[:id])

      if @note.update(note_params)
        redirect_to @note, notice: '編集完了しました'
      else
        render :edit
      end
    end

  # DELETE /notes/1
  # DELETE /notes/1.json

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to root_url
  end



end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
         @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :user_name, :content, :price, :image_1, :image_2, :image_3, :category, :rule,:user_id)
    end
       def user_params
      params.require(:user).permit(:user_name, :profile_pic, :profile, :area, :email)
    end

   def correct_user
    note = Note.find(params[:id])
    if !current_user?(note.user)
      redirect_to root_path if @note.nill?
    end
end

