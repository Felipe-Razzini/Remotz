class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.text :title
      t.text :description
      t.string :priority
      t.boolean :completed
      t.datetime :start
      t.datetime :end
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
