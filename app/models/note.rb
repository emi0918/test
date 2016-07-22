class Note < ActiveRecord::Base
	belongs_to :provider
	belongs_to :user
	belongs_to  :mailboxer_conversations

	has_many :reservations
	has_many :likes, dependent: :destroy
	has_many :liking_users, through: :likes, source: :user
   has_many :reviews


 mount_uploader :service_image1, ServiceImage1Uploader

	validates :title, presence:  true
	validates :category, presence: true
	validates :content, presence: true
	validates :price, presence: true
	validates :rule, presence: true
	validates :salespoint, presence: true
	validates :catchcopy, presence: true
	validates :cancelrule, presence: true



end


