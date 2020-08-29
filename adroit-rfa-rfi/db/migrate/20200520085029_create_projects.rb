class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :company
      t.string :users
      t.string :completion_status
      t.string :city

      t.timestamps
    end
  end
end
