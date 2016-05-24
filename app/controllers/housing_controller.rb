class HousingController < ApplicationController
  def index
  end

    def show
    @note = Note.find(params[:id])

  end


  def move
    @thing = "aaa"
  end
end


