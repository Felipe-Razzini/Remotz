class ChangeColumnToProjects < ActiveRecord::Migration[7.1]
  def change
    change_column :projects, :name,:string
    change_column :projects, :description,:text

  end
end
