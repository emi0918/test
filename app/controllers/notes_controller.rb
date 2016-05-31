class NotesController < ApplicationController

include ApplicationHelper


  # GET /notes
  # GET /notes.json
  def index
<<<<<<< HEAD
=======

>>>>>>> 3d6c39304d2456958ddf86dc587b95104b9d9f56
    @notes = current_user.notes.all
       @notes = Note.page(params[:page]).per(3).order(:id)
  end

<<<<<<< HEAD

=======
>>>>>>> 3d6c39304d2456958ddf86dc587b95104b9d9f56
  # GET /notes/1
  # GET /notes/1.json
def show
    @note = Note.find(params[:id])

end

def search
   @notes = Note.page(params[:page]).per(6).order(:id)
end

  # GET /notes/ne

def new
    @note = Note.new
<<<<<<< HEAD
  end


  # GET /notes/1/sedit
  def edit
    @note = Note.find(params[:id])
  end

def description
 @note = Note.find(params[:id])
              @note.update_attributes (params[:note])
      if @note.update(note_params)
        redirect_to @note, notice: '編集完了しました'
      else
        render :edit
      end
    end


def images
      @note = Note.new
end




  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

     file=params[:note][:image_1]
    @note.set_image(file)
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
        @note = Note.find(params[:id])
              @note.update_attributes (params[:note])
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
     redirect_to notes_url, notice: '掲載削除しました'
=======
>>>>>>> 3d6c39304d2456958ddf86dc587b95104b9d9f56
  end


  # GET /notes/1/sedit
  def edit
    @note = Note.find(params[:id])
correct_user
  end




  # POST /notes
  # POST /notes.json
    def create
    @note = Note.new(note_params)

     file=params[:note][:image_1]
    @note.set_image(file)
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
              @note.update_attributes (params[:note])
      if @note.update(note_params)
        redirect_to @note, notice: '編集完了しました'
      else
        render :edit
      end
    end



  # DELETE /notes/1
  # DELETE /notes/1.json


  def destroy
    correct_user
    @note.destroy
    redirect_to root_path
  end

end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
        @note = current_user.notes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :user_name, :content, :price, :image_1, :image_2, :image_3, :category, :rule,:user_id)
    end
       def user_params
      params.require(:user, :note).permit(:user_name, :profile_pic, :profile, :area, :email)
    end

   def correct_user
    note = Note.find(params[:id])
    if !current_user?(note.user)
      redirect_to root_path
    end
end
<<<<<<< HEAD
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :user_name, :content, :price, :image_1, :image_2, :image_3, :category, :rule)
    end
       def user_params
      params.require(:user, :note).permit(:user_name, :profile_pic, :profile, :area, :email)
    end

   def correct_user
    note = Note.find(params[:id])
    if !current_user?(note.user)
      redirect_to root_path
    end
end
=======



>>>>>>> 3d6c39304d2456958ddf86dc587b95104b9d9f56





