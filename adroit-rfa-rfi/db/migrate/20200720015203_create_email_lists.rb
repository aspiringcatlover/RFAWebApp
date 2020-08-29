class CreateEmailLists < ActiveRecord::Migration[5.2]
  def change
    create_table :email_lists do |t|
      t.string :email
      t.belongs_to :rfa
      t.belongs_to :user

      t.timestamps
    end
  end
end
