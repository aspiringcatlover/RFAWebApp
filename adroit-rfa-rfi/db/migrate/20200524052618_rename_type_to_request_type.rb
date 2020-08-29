class RenameTypeToRequestType < ActiveRecord::Migration[5.2]
  def change
    rename_column :rfas, :type, :request_type
  end
end
