class RemoveGroupFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_reference :categories, :group, index: true, foreign_key: true
  end
end
