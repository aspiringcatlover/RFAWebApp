class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :role
      t.string :trade
      t.string :vendor
      t.string :ref_submitted_RFA
      t.string :ref_submitted_RFI
      t.string :ref_assigned_RFA
      t.string :ref_assigned_RFI
      t.string :ref_handled_RFA
      t.string :ref_handled_RFI

      t.timestamps
    end
  end
end
