class Addindextotouser < ActiveRecord::Migration[5.2]
  def change
    add_index :to_users, :rfa_id
    add_index :to_users, :user_id
  end
end
