
class Category < ActiveRecord::Base

    belongs_to :notes



end

# throughオプションによりcategory_notes経由でnotesにアクセスできるようになる
# category.notesでプロジェクトにアクセスができる


