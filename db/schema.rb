# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_02_16_184544) do
  create_table "conversations", id: uuid, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "title", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations_participants", id: false, force: :cascade do |t|
    t.string "conversation_id", limit: 36, null: false
    t.string "participant_id", limit: 36, null: false
    t.index ["conversation_id", "participant_id"], name: "idx_on_conversation_id_participant_id_d3e7f51e5c"
  end

  create_table "messages", id: uuid, force: :cascade do |t|
    t.string "conversation_id", limit: 36, null: false
    t.datetime "created_at", null: false
    t.string "participant_id", limit: 36, null: false
    t.string "text", null: false
    t.datetime "updated_at", null: false
    t.boolean "urgent", default: false, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["participant_id"], name: "index_messages_on_participant_id"
  end

  create_table "participants", id: uuid, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "full_name", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "participants"
end
