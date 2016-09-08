
class Category < ActiveRecord::Base

    belongs_to :notes


acts_as_nested_set parent_column: :parent_id, left_column: :lft, right_column: :rght


end

# throughオプションによりcategory_notes経由でnotesにアクセスできるようになる
# category.notesでプロジェクトにアクセスができる

