class AddSheetNameToRfas < ActiveRecord::Migration[5.2]
  def change
    add_column :rfas, :sheet_name, :string
  end
end
