class AddIndexToTable < ActiveRecord::Migration[5.2]
  def change
    add_index :rfas, [:ref, :number, :rev], unique: true
  end
end
