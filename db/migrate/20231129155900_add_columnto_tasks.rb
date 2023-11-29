class AddColumntoTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :status, :string
  end
end
