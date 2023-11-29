class AddColumntoProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :status, :string
  end
end
