class CategoryController < ApplicationController

    def show
     @category = Category.find(params[:id])
    @notes = Note.find(:all, :conditions => ["category_id = ?", params[:id]])
    end

    def housing
       

    	@maincategories =Category.where(:id => [(1),(2),(3),(4),(5)]  )
     	@parentcategories =Category.find_by(name: params[:category]).id
     
      @categories =  Category.where(:parent_id => (1))
     
	   
	end


    def event
      @maincategories =Category.where(:id => [(1),(2),(3),(4),(5)]  )
      @parentcategories =Category.find_by(name: params[:category]).id
      @categories =  Category.where(:parent_id => (2))
  end

    def lesson
      @maincategories =Category.where(:id => [(1),(2),(3),(4),(5)]  )
      @parentcategories =Category.find_by(name: params[:category]).id
      @categories =  Category.where(:parent_id => (3))
    end

    def health
      @maincategories =Category.where(:id => [(1),(2),(3),(4),(5)]  )
      @parentcategories =Category.find_by(name: params[:category]).id
      @categories =  Category.where(:parent_id => (4))
    end
end

