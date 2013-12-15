class AddActivityIdToInstances < ActiveRecord::Migration
  def change
    add_column :instances, :activity_id, :integer
  end
end
