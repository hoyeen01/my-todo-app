class AddUserIdToTodoList < ActiveRecord::Migration[6.1]
  def change
    add_column :todo_lists, :user_id, :integer

    add_foreign_key :todo_lists, :users, column: :user_id

    # t.belongs_to :user
  end
end
