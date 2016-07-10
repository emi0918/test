class Note < ActiveRecord::Base
	belongs_to :provider
belongs_to :user
		has_many :likes, dependent: :destroy
has_many :liking_users, through: :likes, source: :user

	validates :image_1, presence: false
	validates :image_2, presence: false
	validates :image_3, presence: false
  validates :title, presence:  true
  validates :category, presence: true
  validates :content, presence: true
  validates :price, presence: true
  validates :rule, presence: false

	def set_image_1(file)
		 if !file.nil?
			file_name = file.original_filename
			File.open("public/note_images/#{file_name}", 'wb'){|f| f.write(file.read)}
			self.image_1 = file_name
		end
	end
end











