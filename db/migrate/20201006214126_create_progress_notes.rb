class CreateProgressNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :progress_notes do |t|

      t.references :therapist, null: false
      t.references :client, null: false

      t.string :title, null: false
      t.text :note, null: false

      t.timestamps
    end
  end
end
