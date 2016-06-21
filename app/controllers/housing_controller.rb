class HousingController < ApplicationController


    def show
    @note = Note.find(params[:id])
    end


end


