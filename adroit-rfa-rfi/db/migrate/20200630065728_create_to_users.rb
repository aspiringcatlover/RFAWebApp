class CreateToUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :to_users do |t|
        t.integer "rfa_id"
        t.integer "user_id"
        t.datetime "created_at", null:false
        t.datetime "updated_at", null:false


    end
  end
end
