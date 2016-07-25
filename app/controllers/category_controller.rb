class CategoryController < ApplicationController


    def show
     @category = Category.find(params[:id])
    @notes = Note.find(:all, :conditions => ["category_id = ?", params[:id]])
    end


end


