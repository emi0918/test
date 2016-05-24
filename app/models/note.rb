class Note < ActiveRecord::Base
  belongs_to :user






  validates :image_1, presence: false
   validates :image_2, presence: false
    validates :image_3, presence: false


validates_presence_of :title, {
    on: :update
  }
  validates_presence_of :category, {
    on: :update
  }
validates_presence_of :content, {
    on: :update
  }
validates_presence_of :price, {
    on: :update
  }

validates_presence_of :rule, {
    on: :update
  }



  def set_image(file)
     if !file.nil?
      file_name = file.original_filename
      File.open("public/note_images/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image_1 = file_name
    end

  end

end
