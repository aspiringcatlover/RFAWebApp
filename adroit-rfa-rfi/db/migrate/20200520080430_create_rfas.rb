class CreateRfas < ActiveRecord::Migration[5.2]
  def change
    create_table :rfas do |t|
      t.string :ref
      t.string :project
      t.string :type
      t.boolean :completed
      t.integer :number
      t.string :rev
      t.text :subject
      t.datetime :issued_date
      t.datetime :required_reply_date
      t.string :to
      t.datetime :reply_date
      t.datetime :approval_date
      t.string :replied_by
      t.string :status
      t.integer :days_lagging
      t.integer :count
      t.text :transmittal_advice
      t.text :remarks
      t.string :trade
      t.string :emailed_to
      t.integer :gridline

      t.timestamps
    end
  end
end
