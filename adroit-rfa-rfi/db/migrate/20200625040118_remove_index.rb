class RemoveIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :rfas, name: "index_rfas_on_ref_and_number_and_rev"

  end
end
