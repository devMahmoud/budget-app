class CreateGroupOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :group_operations, id: false do |t|
      t.references :group, foreign_key: true, index: true
      t.references :operation, foreign_key: true, index: true

      t.timestamps
    end
  end
end
