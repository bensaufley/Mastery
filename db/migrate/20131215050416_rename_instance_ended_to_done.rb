class RenameInstanceEndedToDone < ActiveRecord::Migration
  def change
    rename_column :instances, :ended, :done
    remove_column :instances, :tallied
  end
  def down
    add_column :instances, :tallied, :timestamp
  end
end
