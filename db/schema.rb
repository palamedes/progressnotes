# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_07_204031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attempts", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "vocabulary_id", null: false
    t.boolean "successful", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_attempts_on_client_id"
    t.index ["vocabulary_id"], name: "index_attempts_on_vocabulary_id"
  end

  create_table "clients", force: :cascade do |t|
    t.bigint "therapist_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["therapist_id"], name: "index_clients_on_therapist_id"
  end

  create_table "progress_notes", force: :cascade do |t|
    t.bigint "therapist_id", null: false
    t.bigint "client_id", null: false
    t.string "title", null: false
    t.text "note", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_progress_notes_on_client_id"
    t.index ["therapist_id"], name: "index_progress_notes_on_therapist_id"
  end

  create_table "therapists", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vocabularies", force: :cascade do |t|
    t.string "word", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
