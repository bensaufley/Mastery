class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.string :type
      t.timestamp :when
      t.timestamp :started
      t.timestamp :ended
      t.boolean :private

      t.timestamps
    end
  end
end
