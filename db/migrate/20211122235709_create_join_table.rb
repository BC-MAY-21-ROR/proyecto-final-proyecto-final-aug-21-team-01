class CreateJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :groups, column_options: { null: false, foreign_key: true } do |t|
      t.index [:user_id, :group_id]
      t.index [:group_id, :user_id]
    end
  end
end
