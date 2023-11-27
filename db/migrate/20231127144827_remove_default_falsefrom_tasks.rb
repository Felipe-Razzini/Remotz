class RemoveDefaultFalsefromTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tasks, :project_id, true
  end
end
