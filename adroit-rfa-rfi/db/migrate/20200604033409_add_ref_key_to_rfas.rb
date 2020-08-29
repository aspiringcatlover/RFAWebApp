class AddRefKeyToRfas < ActiveRecord::Migration[5.2]
  def change
    add_column :rfas, :ref_key, :string
  end
end
