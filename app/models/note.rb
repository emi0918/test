class Note < ActiveRecord::Base
	belongs_to :provider
	belongs_to :user
	belongs_to  :mailboxer_conversations
	has_many :likes, dependent: :destroy
	has_many :liking_users, through: :likes, source: :user
   

  validates_acceptance_of :confirming
  after_validation :check_confirming

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end

	validates :title, presence:  true
	validates :category, presence: true
	validates :content, presence: true
	validates :price, presence: true
	validates :rule, presence: true
	validates :salespoint, presence: true
	validates :catchcopy, presence: true
	validates :cancelrule, presence: true

	def set_image_1(file)
		if !file.nil?
			file_name = file.original_filename
			File.open("public/note_images/#{file_name}", 'wb'){|f| f.write(file.read)}
			self.image_1 = file_name
		end
	end
end


