class NotesController < ApplicationController



 before_action :set_note, only: [:show,:edit, :update, :destroy, :profile]
 before_action :authenticate_user!, only:[:profile]
 before_action :authenticate_provider!, only:[:index, :new, :edit, :create]
 include ApplicationHelper


  # GET /notes
  # GET /notes.json
  def index
    @notes = current_provider.notes.all.page(params[:page]).per(3).order(:id)
    render :layout => 'providers_layout.html'
  end

  def detail
     @notes = Note.includes(:provider).all
    @notes = Note.includes(:user).all
    @note = Note.find(params[:id])
  end

  def reservations
    @notes = current_provider.notes.all.page(params[:page]).per(3).order(:id)
    render :layout => 'providers_layout.html'
  end
 
  def show
 
    @note_revisions = @note.note_revisions
      @note_images = @note.note_images
    @notes = Note.includes(:provider).all
    @notes = Note.includes(:user).all
    @note = Note.find(params[:id])
    @reviews = Review.where(note_id: @note.id).order("created_at DESC")
   if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
   end
  end


  def housing



    @notes = Note.page(params[:page]).per(6).where( :category_id => 1 )
  end

  def event
    @notes = Note.includes(:provider).page(params[:page]).per(6).where( :category_id => 2)
  end

  def lesson
    @notes = Note.includes(:provider).page(params[:page]).per(6).where( :category_id => 3 )
  end

  def health
    @notes = Note.includes(:provider).page(params[:page]).per(6).where( :category_id => 4 )
  end



  def profile
    @notes = Note.includes(:provider).all
  end

  # GET /notes/ne
  def new
       @note = Note.new
       @note.note_revisions.build #追加
              @note.note_images.build #追加
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
     if @note.save
      redirect_to  @note
     NoteMailer.note_email(@provider, @note).deliver
#redirect_to @note で作成されたものが表示される
     else
      render :new
     end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
        @note = Note.find(params[:id])

    if @note.update(update_note_params)
      redirect_to @note, notice: '編集完了しました'
    else
      render 'edit'
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
      params.require(:note).permit(:provider_id, :category_id,
       note_images_attributes: [:image1,:image2,:image3,:image4,:image5,:image6,:image7,:image8,:image9],
        note_revisions_attributes: [:title, :note_id,:name,:content,:price,:salespoint,:cancelrule,:rule,:catchcopy,:category_id,])
    end

   def update_note_params
      params.require(:note).permit(:provider_id, :category_id,
        note_images_attributes: [:image1,:image2,:image3,:image4,:image5,:image6,:image7,:image8,:image9,:_destroy, :id],
        note_revisions_attributes: [:title, :note_id,:name,:content,:price,:salespoint,:cancelrule,:rule,:catchcopy,:category_id,:_destroy, :id])

    end





    def user_params
      params.require(:user).permit(:name,  :profile, :area, :email)
    end
end


