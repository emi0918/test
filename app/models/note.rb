class Note < ActiveRecord::Base
	belongs_to :provider, dependent: :destroy
	belongs_to :user, dependent: :destroy
	belongs_to  :mailboxer_conversations, dependent: :destroy
    belongs_to :category
	has_many :reservations, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :liking_users, through: :likes, source: :user
   has_many :reviews, dependent: :destroy
has_many :mailboxer_conversations
  has_many :category_notes
  has_many :categories, through: :category_notes

 mount_uploader :service_image1, ServiceImage1Uploader

	validates :title, presence:  true
	validates :category_id, presence: true
	validates :content, presence: true
	validates :price, presence: true
	validates :rule, presence: true
	validates :salespoint, presence: true
	validates :catchcopy, presence: true
	validates :cancelrule, presence: true
	
end

