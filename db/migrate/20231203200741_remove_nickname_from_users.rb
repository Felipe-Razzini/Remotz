class RemoveNicknameFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :nickname
  end
end
