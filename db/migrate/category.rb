class Category < ActiveRecord::Base
	has_many :category_notes
    has_many :notes, through: :category_notes
    has_many :detail_categories

end

# throughオプションによりcategory_notes経由でnotesにアクセスできるようになる
# category.notesでプロジェクトにアクセスができる


