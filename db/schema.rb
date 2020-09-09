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

ActiveRecord::Schema.define(version: 2020_09_09_191846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", comment: "記事管理", force: :cascade do |t|
    t.string "subject", null: false, comment: "記事のタイトル"
    t.text "body", null: false, comment: "記事の本文"
    t.boolean "published_status", default: false, comment: "公開非公開ステータス"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["published_status"], name: "index_articles_on_published_status"
  end

  create_table "articles_comments", comment: "記事とコメントの中間テーブル", force: :cascade do |t|
    t.integer "comments_id", null: false, comment: "コメントのID"
    t.integer "article_id", null: false, comment: "記事のID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_articles_comments_on_article_id"
    t.index ["comments_id"], name: "index_articles_comments_on_comments_id"
  end

  create_table "comments", comment: "記事のコメント管理", force: :cascade do |t|
    t.text "text", null: false, comment: "記事へのコメント"
    t.integer "article_id", null: false, comment: "記事のID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
