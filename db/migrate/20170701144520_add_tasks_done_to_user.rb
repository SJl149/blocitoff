class AddTasksDoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :tasks_done, :integer
  end
end
