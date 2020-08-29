class ReferenceToProject < ActiveRecord::Migration[5.2]
  def change
    add_reference :rfas, :project
  end
end
