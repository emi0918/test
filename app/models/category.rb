class Category < ActiveRecord::Base

    belongs_to :notes

    belongs_to :note_revisions

acts_as_nested_set

end

# throughオプションによりcategory_notes経由でnotesにアクセスできるようになる
# category.notesでプロジェクトにアクセスができる


