class RemoveColumnFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :description
  end
end
