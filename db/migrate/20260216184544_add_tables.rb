class AddTables < ActiveRecord::Migration[8.1]
  def change
    create_table :conversations, id: :uuid do |t|
      t.string :title, null: false
      t.string :description, null: true
      t.timestamps
    end

    create_table :participants, id: :uuid do |t|
      t.string :full_name, null: false
      t.timestamps
    end

    create_table :messages, id: :uuid do |t|
      t.references :conversation, type: :uuid, null: false, foreign_key: true
      t.references :participant, type: :uuid, null: false, foreign_key: true
      t.boolean :urgent, null: false, default: false
      t.string :text, null: false
      t.timestamps
    end

    create_join_table :conversations, :participants do |t|
      t.index [:conversation_id, :participant_id]
    end
  end
end
