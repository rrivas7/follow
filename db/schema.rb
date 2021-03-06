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

ActiveRecord::Schema.define(version: 2019_06_25_051458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "author"
    t.string "source"
    t.string "title"
    t.text "description"
    t.text "content"
    t.string "url"
    t.string "image_url"
    t.datetime "published_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "articles_followees", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "followee_id"
    t.index ["article_id"], name: "index_articles_followees_on_article_id"
    t.index ["followee_id"], name: "index_articles_followees_on_followee_id"
  end

  create_table "followees", force: :cascade do |t|
    t.string "name"
    t.string "article_query"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "followee_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["followee_id"], name: "index_users_on_followee_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles_followees", "articles"
  add_foreign_key "articles_followees", "followees"
  add_foreign_key "users", "followees"
end
