class NotesController < ApplicationController
 
 before_action :set_note, only: [:show,:edit, :update, :destroy, :profile]
 before_action :authenticate_user!, only:[:profile]
 before_action :authenticate_provider!, only:[:index, :new, :edit, :create]
 include ApplicationHelper

  # GET /notes
  # GET /notes.json
  def index
    @notes = current_provider.notes.all
    @notes = Note.includes(:provider).page(params[:page]).per(3).order(:id)
    render :layout => 'providers_layout.html'
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
   @notes = Note.includes(:provider).all
   @note = Note.find(params[:id])
 end

 def search
   @notes = Note.includes(:provider).page(params[:page]).per(6).order(:id)
 end


 def search
   @notes = Note.includes(:provider).page(params[:page]).per(6).order(:id)
 end
 def profile
   @notes = Note.includes(:provider).all
 end

  # GET /notes/ne

  def new
   @note = Note.new
   render :layout => 'providers_layout.html'
 end

  # GET /notes/1/sedit
  def edit
    @note = Note.find(params[:id])
 render :layout => 'providers_layout.html'
  end


  # POST /notes
  # POST /notes.json
  def create

    @note = current_provider.notes.build(note_params)

    file=params[:note][:image_1]
    @note.set_image_1(file)

    if @note.save
     redirect_to  @note
#redirect_to @note で作成されたものが表示される
else
 render :new
end
end


  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update

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
    @note.destroy
    redirect_to root_url
  end


  def mailbox
       @mailbox ||= current_user or current_provider.mailbox
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
     @note = Note.find(params[:id])
   end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :name, :content, :price, :image_1, :image_2, :image_3, :category, :rule,:provider_id,:cancelrule, :salespoint, :catchcopy)
    end
    def user_params
      params.require(:user).permit(:name, :profile_pic, :profile, :area, :email)
    end
  end

