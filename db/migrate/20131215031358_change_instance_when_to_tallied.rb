class ChangeInstanceWhenToTallied < ActiveRecord::Migration
  def change
    rename_column :instances, :when, :tallied
  end
end
