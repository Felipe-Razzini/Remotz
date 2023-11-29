class ChangeColumnfromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :completed
  end
end
