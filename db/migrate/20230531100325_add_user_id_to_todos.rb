class AddUserIdToTodos < ActiveRecord::Migration[7.0]
  def change
    add_reference :todos, :user, null: true, foreign_key: true
  end
end
