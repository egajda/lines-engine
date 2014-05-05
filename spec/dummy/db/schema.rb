# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140505122014) do

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", unique: true, using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "lines_articles", force: true do |t|
    t.string   "title"
    t.string   "sub_title"
    t.text     "content"
    t.boolean  "published",        default: false
    t.datetime "published_at"
    t.string   "hero_image"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "slug"
    t.string   "gplus_url"
    t.boolean  "featured",         default: false
    t.string   "document"
    t.string   "short_hero_image"
  end

  add_index "lines_articles", ["slug"], name: "index_lines_articles_on_slug", unique: true, using: :btree

  create_table "lines_authorables", force: true do |t|
    t.integer  "lines_author_id"
    t.integer  "lines_article_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "lines_authorables", ["lines_article_id"], name: "index_lines_authorables_on_article_id", using: :btree
  add_index "lines_authorables", ["lines_author_id"], name: "index_lines_authorables_on_author_id", using: :btree

  create_table "lines_authors", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "description"
    t.string   "gplus_profile"
  end

  create_table "lines_pictures", force: true do |t|
    t.string   "image"
    t.string   "name"
    t.integer  "lines_article_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "lines_pictures", ["lines_article_id"], name: "index_lines_pictures_on_article_id", using: :btree

  create_table "lines_users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

end