class Category < ActiveRecord::Base

    belongs_to :notes

    belongs_to :note_revisions


end

# throughオプションによりcategory_notes経由でnotesにアクセスできるようになる
# category.notesでプロジェクトにアクセスができる


