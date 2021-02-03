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

ActiveRecord::Schema.define(version: 2021_02_03_130810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string "nom", null: false
    t.bigint "ville_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ville_id"], name: "index_clubs_on_ville_id"
  end

  create_table "clubs_profiles", id: false, force: :cascade do |t|
    t.bigint "club_id", null: false
    t.bigint "profile_id", null: false
    t.index ["club_id", "profile_id"], name: "index_clubs_profiles_on_club_id_and_profile_id"
    t.index ["profile_id", "club_id"], name: "index_clubs_profiles_on_profile_id_and_club_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "titre_poste", null: false
    t.text "description", null: false
    t.boolean "poste_actuel", default: true
    t.string "type_poste", null: false
    t.string "nom_societe"
    t.string "localisation", null: false
    t.date "debut_occupation_poste", null: false
    t.date "fin_occupation_poste"
    t.bigint "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_experiences_on_profile_id"
  end

  create_table "formations", force: :cascade do |t|
    t.string "intitule", null: false
    t.string "niveau", null: false
    t.string "specialisation"
    t.string "nom_institution", null: false
    t.string "localisation", null: false
    t.date "debut_formation", null: false
    t.date "fin_formation"
    t.bigint "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_formations_on_profile_id"
  end

  create_table "pays", force: :cascade do |t|
    t.string "nom", null: false
    t.string "code_iso", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.text "adresse"
    t.string "photo_url"
    t.string "niveau_etude"
    t.string "profession"
    t.string "occupation_actuelle"
    t.text "attentes_networking"
    t.boolean "membre_equipe_pilote", default: false
    t.string "statut", limit: 10
    t.date "date_adhesion"
    t.date "date_resiliation"
    t.text "motif_resiliation"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reseau_socials", force: :cascade do |t|
    t.string "nom_reseau", null: false
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "telephones", force: :cascade do |t|
    t.boolean "numero_principal", default: false
    t.string "numero", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_telephones_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "villes", force: :cascade do |t|
    t.string "nom", null: false
    t.bigint "pay_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pay_id"], name: "index_villes_on_pay_id"
  end

  add_foreign_key "clubs", "villes"
  add_foreign_key "experiences", "profiles"
  add_foreign_key "formations", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "telephones", "profiles"
  add_foreign_key "villes", "pays"
end
