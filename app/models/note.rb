class Note < ActiveRecord::Base
	has_many :note_revisions, dependent: :destroy
	 accepts_nested_attributes_for :note_revisions,allow_destroy: true
    has_many :note_images,  dependent: :destroy
     accepts_nested_attributes_for :note_images,allow_destroy: true
	belongs_to :provider
	belongs_to :user
	belongs_to  :mailboxer_conversations
    belongs_to :category
	has_many :reservations, :dependent => :destroy
	
   has_many :reviews, dependent: :destroy
has_many :mailboxer_conversations

  has_many :categories





validates :category_id, presence: true

end


