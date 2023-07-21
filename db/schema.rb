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

ActiveRecord::Schema[7.0].define(version: 2023_07_20_203401) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "claims", force: :cascade do |t|
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.string "name", null: false
    t.text "description"
    t.boolean "claimed", default: false
    t.integer "x_coord", null: false
    t.integer "y_coord", null: false
    t.boolean "right", default: false
    t.boolean "top", default: false
    t.boolean "left", default: false
    t.boolean "bottom", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_type", "source_id"], name: "index_claims_on_source"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "job", null: false
    t.boolean "friend", default: false
    t.boolean "rival", default: false
    t.bigint "playbook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order", null: false
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.index ["source_type", "source_id"], name: "index_contacts_on_source"
  end

  create_table "crews", force: :cascade do |t|
    t.string "name"
    t.integer "playbook_id", null: false
    t.integer "reputation"
    t.text "reputation_description"
    t.integer "lair"
    t.text "lair_description"
    t.integer "hunting_ground"
    t.text "hunting_ground_description"
    t.integer "turf", default: 0
    t.integer "hold", default: 0
    t.integer "tier", default: 0
    t.integer "heat", default: 0
    t.integer "vaults", default: 0
    t.integer "coin", default: 0
    t.integer "wanted_level", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "xp", default: 0
    t.integer "rep", default: 0
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "harms", force: :cascade do |t|
    t.bigint "player_character_id", null: false
    t.string "label", default: ""
    t.integer "level", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_character_id"], name: "index_harms_on_player_character_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.integer "cost", default: 1
    t.boolean "intrinsic", default: false
    t.bigint "player_character_id", null: false
    t.boolean "default", default: false
    t.bigint "playbook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "loaded", default: false
    t.integer "order", null: false
    t.index ["player_character_id"], name: "index_items_on_player_character_id"
  end

  create_table "playbooks", force: :cascade do |t|
    t.bigint "player_character_id", null: false
    t.string "playbook_name", default: "hound", null: false
    t.jsonb "items"
    t.jsonb "contacts"
    t.jsonb "special_abilities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_character_id"], name: "index_playbooks_on_player_character_id"
  end

  create_table "player_characters", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.bigint "playbook_id", null: false
    t.boolean "retired", default: false
    t.string "name"
    t.string "nickname"
    t.text "look"
    t.integer "heritage"
    t.text "heritage_description"
    t.integer "background"
    t.text "background_description"
    t.integer "vice"
    t.text "vice_description"
    t.integer "stress", default: 0
    t.boolean "armor", default: false
    t.boolean "heavy", default: false
    t.boolean "special", default: false
    t.integer "xp", default: 0
    t.integer "insight_xp", default: 0
    t.integer "prowess_xp", default: 0
    t.integer "resolve_xp", default: 0
    t.integer "coin", default: 0
    t.integer "stash", default: 0
    t.integer "load", default: 5
    t.integer "hunt", default: 0
    t.integer "study", default: 0
    t.integer "survey", default: 0
    t.integer "tinker", default: 0
    t.integer "finesse", default: 0
    t.integer "prowl", default: 0
    t.integer "skirmish", default: 0
    t.integer "wreck", default: 0
    t.integer "attune", default: 0
    t.integer "command", default: 0
    t.integer "consort", default: 0
    t.integer "sway", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "healing_clock", default: 0
    t.bigint "crew_id"
    t.index ["game_id"], name: "index_player_characters_on_game_id"
    t.index ["user_id"], name: "index_player_characters_on_user_id"
  end

  create_table "special_abilities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "cost", default: 1
    t.integer "points", default: 0
    t.string "detail"
    t.bigint "playbook_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order", null: false
    t.boolean "multipart", default: false
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.index ["source_type", "source_id"], name: "index_special_abilities_on_source"
  end

  create_table "traumas", force: :cascade do |t|
    t.bigint "player_character_id", null: false
    t.integer "trauma", default: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_character_id"], name: "index_traumas_on_player_character_id"
  end

  create_table "upgrades", force: :cascade do |t|
    t.bigint "crew_id", null: false
    t.string "name", null: false
    t.integer "cost", default: 1
    t.integer "points", default: 0
    t.integer "order", null: false
    t.integer "playbook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.index ["crew_id"], name: "index_upgrades_on_crew_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "users"
  add_foreign_key "harms", "player_characters"
  add_foreign_key "items", "player_characters"
  add_foreign_key "playbooks", "player_characters"
  add_foreign_key "player_characters", "games"
  add_foreign_key "player_characters", "users"
  add_foreign_key "traumas", "player_characters"
  add_foreign_key "upgrades", "crews"
end
