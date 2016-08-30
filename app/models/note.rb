class Note < ActiveRecord::Base
	has_many :note_revisions, dependent: :destroy
	 accepts_nested_attributes_for :note_revisions,allow_destroy: true
has_many :note_images,  dependent: :destroy
 accepts_nested_attributes_for :note_images,allow_destroy: true

	belongs_to :provider, dependent: :destroy
	belongs_to :user, dependent: :destroy
	belongs_to  :mailboxer_conversations, dependent: :destroy
    belongs_to :category
	has_many :reservations, :dependent => :destroy
	has_many :likes, dependent: :destroy
	has_many :liking_users, through: :likes, source: :user
   has_many :reviews, dependent: :destroy
has_many :mailboxer_conversations
  has_many :category_notes
  has_many :categories, through: :category_notes






validates :category_id, presence: true

end

