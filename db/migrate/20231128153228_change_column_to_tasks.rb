class ChangeColumnToTasks < ActiveRecord::Migration[7.1]
  def change
    change_column :tasks, :title,:string
  end
end
