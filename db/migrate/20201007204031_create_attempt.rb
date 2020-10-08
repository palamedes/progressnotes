class CreateAttempt < ActiveRecord::Migration[6.0]
  def change
    create_table :attempts do |t|

      t.references :client, null: false
      t.references :progress_note, null: false
      t.references :vocabulary

      t.integer :note_index, null: false
      t.boolean :successful, default: false

      t.timestamps
    end
  end
end
