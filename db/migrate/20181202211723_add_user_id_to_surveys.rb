class AddUserIdToSurveys < ActiveRecord::Migration[5.1]
  def change
    add_column :surveys, :user_id, :integer
  end
  add_index :surveys, :user_id
end
