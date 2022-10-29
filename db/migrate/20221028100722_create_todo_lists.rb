class CreateTodoLists < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_lists do |t|
      t.string :name, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end