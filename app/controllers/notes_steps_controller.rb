class NotesStepsController < ApplicationController
    before_filter :authenticate_user!
  include Wicked::Wizard
  steps :description, :images, :price

  def show
      @note = Note.new
      case step
      when :price
        skip_step if @note.rule.blank?
      end
    render_wizard
  end

   def update
      @note = Note.find(params[:id])

      @note.update_attributes (params[:note])
  render_wizard @note
end


    def create
    @note = Note.new(note_params)

       file=params[:note][:image_1]
    @note.set_image(file)
    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: '作成完了' }
        format.json { render :show, status: :created, location: @note }
      else
   format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end



  private

    def note_params
      params.require(:note).permit(:title, :user_name, :content, :price, :image_1, :image_2, :image_3, :category, :rule)
    end

end


