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

ActiveRecord::Schema[7.0].define(version: 2022_12_09_115044) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alternativas", force: :cascade do |t|
    t.string "descricao"
    t.boolean "correto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "explicacao"
  end

  create_table "dificuldades", force: :cascade do |t|
    t.string "nivel"
    t.integer "pontuacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questao_alternativas", force: :cascade do |t|
    t.bigint "questao_id", null: false
    t.bigint "alternativa_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alternativa_id"], name: "index_questao_alternativas_on_alternativa_id"
    t.index ["questao_id"], name: "index_questao_alternativas_on_questao_id"
  end

  create_table "questoes", force: :cascade do |t|
    t.string "enunciado"
    t.bigint "dificuldade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dificuldade_id"], name: "index_questoes_on_dificuldade_id"
  end

  create_table "tentativa_questaos", force: :cascade do |t|
    t.bigint "questao_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tentativa_id"
    t.index ["questao_id"], name: "index_tentativa_questaos_on_questao_id"
  end

  create_table "tentativas", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
    t.index ["user_id"], name: "index_tentativas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "nome_usuario"
    t.integer "tipo_usuario"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "questao_alternativas", "alternativas"
  add_foreign_key "questao_alternativas", "questoes", column: "questao_id"
  add_foreign_key "questoes", "dificuldades"
  add_foreign_key "tentativa_questaos", "questoes", column: "questao_id"
  add_foreign_key "tentativas", "users"
end
