class CreateActivityLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_logs do |t|
      t.string :loggable_type
      t.integer :loggable_id
      t.text :changes_text
      t.timestamps
    end
    add_index :activity_logs, [:loggable_type, :loggable_id]
  end
end