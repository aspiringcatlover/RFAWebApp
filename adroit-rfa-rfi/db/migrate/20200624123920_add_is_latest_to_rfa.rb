class AddIsLatestToRfa < ActiveRecord::Migration[5.2]
  def change
    add_column :rfas, :is_latest, :boolean
  end
end
