class AddTimeToAlerts < ActiveRecord::Migration[7.1]
  def change
    add_column :alerts, :time, :datetime
  end
end
