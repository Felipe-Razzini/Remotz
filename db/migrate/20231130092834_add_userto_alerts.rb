class AddUsertoAlerts < ActiveRecord::Migration[7.1]
  def change
    add_reference :alerts, :user, foreign_key: true
  end
end
