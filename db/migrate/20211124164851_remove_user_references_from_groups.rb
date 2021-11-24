class RemoveUserReferencesFromGroups < ActiveRecord::Migration[6.1]
  def change
    remove_reference :groups, :user, index: true, foreign_key: true
  end
end
