class ChangeColumnfromProjects < ActiveRecord::Migration[7.1]
  def change
    remove_column :projects, :completed
  end
end
