class Category < ActiveRecord::Base

    belongs_to :notes
    
  acts_as_nested_set
  accepts_nested_attributes_for :children

end

# throughオプションによりcategory_notes経由でnotesにアクセスできるようになる
# category.notesでプロジェクトにアクセスができる


