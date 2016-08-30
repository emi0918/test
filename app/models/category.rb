class Category < ActiveRecord::Base
	has_many :category_notes
    belongs_to :notes
    has_many :detail_categories
    belongs_to :note_revisions

end

# throughオプションによりcategory_notes経由でnotesにアクセスできるようになる
# category.notesでプロジェクトにアクセスができる


