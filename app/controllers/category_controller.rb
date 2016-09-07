class CategoryController < ApplicationController

    def show
     @category = Category.find(params[:id])
    @notes = Note.find(:all, :conditions => ["category_id = ?", params[:id]])
    end

    def housing
    	 @housecategories =  Category.where(:parent_id => (1))
			@category= Category.find_by(name: params[:category])
			@notes = Note.where(category_id: @category_id).order("created_at DESC")
	end


end
