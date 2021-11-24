class DropJoinTableUsersGroups < ActiveRecord::Migration[6.1]
  def change
    drop_join_table :users, :groups 
  end
end
