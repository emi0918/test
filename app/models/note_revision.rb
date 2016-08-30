# == Schema Information
#
# Table name: note_revisions
#  id        :integer          not null, primary key
#  note_id   :integer
#  category_id  :integer
#  title     :string
#  content   :text
#  price    :integer
#  rule    :text
#  catchcopy :text
#  salespoint  :text
#  cancelrule    :text
#



class NoteRevision < ActiveRecord::Base
	 belongs_to :note, foreign_key: "note_id"
 has_one :category

	validates :title, presence:  true
	
	validates :content, presence: true
	validates :price, presence: true
	validates :rule, presence: true
	validates :salespoint, presence: true
	validates :catchcopy, presence: true
	validates :cancelrule, presence: true
	

end





