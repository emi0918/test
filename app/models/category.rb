class Category < ActiveRecord::Base


acts_as_nested_set



    belongs_to :notes


end

# throughオプションによりcategory_notes経由でnotesにアクセスできるようになる
# category.notesでプロジェクトにアクセスができる


