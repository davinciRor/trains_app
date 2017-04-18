class RenameColumnKindForCarriage < ActiveRecord::Migration
  def change
    remove_column :carriages, :kind
    add_column :carriages, :type, :string
  end
end
