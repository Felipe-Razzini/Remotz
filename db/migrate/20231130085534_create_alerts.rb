class CreateAlerts < ActiveRecord::Migration[7.1]
  def change
    create_table :alerts do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
