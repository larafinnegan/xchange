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

ActiveRecord::Schema.define(version: 20150922005242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.string   "name"
    t.string   "postcode"
    t.boolean  "expert"
    t.integer  "individual_id"
    t.boolean  "under_18"
    t.boolean  "group"
    t.integer  "distance"
    t.integer  "search_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.decimal  "lat",           precision: 10, scale: 6
    t.decimal  "lng",           precision: 10, scale: 6
  end

  add_index "alerts", ["individual_id"], name: "index_alerts_on_individual_id", using: :btree

  create_table "alerts_interests", id: false, force: :cascade do |t|
    t.integer "alert_id",    null: false
    t.integer "interest_id", null: false
  end

  add_index "alerts_interests", ["alert_id"], name: "index_alerts_interests_on_alert_id", using: :btree
  add_index "alerts_interests", ["interest_id"], name: "index_alerts_interests_on_interest_id", using: :btree

  create_table "alerts_skills", id: false, force: :cascade do |t|
    t.integer "alert_id", null: false
    t.integer "skill_id", null: false
  end

  add_index "alerts_skills", ["alert_id"], name: "index_alerts_skills_on_alert_id", using: :btree
  add_index "alerts_skills", ["skill_id"], name: "index_alerts_skills_on_skill_id", using: :btree

  create_table "applications", force: :cascade do |t|
    t.integer  "individual_id"
    t.integer  "opportunity_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "applications", ["individual_id"], name: "index_applications_on_individual_id", using: :btree
  add_index "applications", ["opportunity_id"], name: "index_applications_on_opportunity_id", using: :btree

  create_table "classifications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts_organisations", id: false, force: :cascade do |t|
    t.integer "district_id"
    t.integer "organisation_id"
  end

  create_table "individuals", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "phone"
    t.text     "additional_skills"
    t.string   "town"
    t.string   "postcode"
    t.decimal  "lat",               precision: 10, scale: 6
    t.decimal  "lng",               precision: 10, scale: 6
  end

  add_index "individuals", ["user_id"], name: "index_individuals_on_user_id", using: :btree

  create_table "individuals_skills", id: false, force: :cascade do |t|
    t.integer "individual_id"
    t.integer "skill_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests_organisations", id: false, force: :cascade do |t|
    t.integer "interest_id"
    t.integer "organisation_id"
  end

  create_table "interests_searches", id: false, force: :cascade do |t|
    t.integer "interest_id", null: false
    t.integer "search_id",   null: false
  end

  add_index "interests_searches", ["interest_id"], name: "index_interests_searches_on_interest_id", using: :btree
  add_index "interests_searches", ["search_id"], name: "index_interests_searches_on_search_id", using: :btree

  create_table "opportunities", force: :cascade do |t|
    t.string   "name"
    t.integer  "organisation_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.text     "tasks"
    t.string   "commitment"
    t.date     "close"
    t.text     "benefits"
    t.boolean  "reimburse_expenses"
    t.text     "additional_information"
    t.boolean  "under_18"
    t.boolean  "expert"
    t.boolean  "group"
    t.string   "town"
    t.string   "postcode"
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "title"
    t.string   "email"
    t.decimal  "lat",                    precision: 10, scale: 6
    t.decimal  "lng",                    precision: 10, scale: 6
  end

  add_index "opportunities", ["organisation_id"], name: "index_opportunities_on_organisation_id", using: :btree
  add_index "opportunities", ["user_id"], name: "index_opportunities_on_user_id", using: :btree

  create_table "opportunities_skills", id: false, force: :cascade do |t|
    t.integer "opportunity_id"
    t.integer "skill_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "website"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "town"
    t.string   "county"
    t.string   "postcode"
    t.text     "description"
    t.integer  "classification_id"
    t.string   "twitter"
    t.decimal  "lat",               precision: 10, scale: 6
    t.decimal  "lng",               precision: 10, scale: 6
  end

  add_index "organisations", ["classification_id"], name: "index_organisations_on_classification_id", using: :btree

  create_table "posters", force: :cascade do |t|
    t.string   "mobile"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organisation_id"
    t.string   "title"
    t.integer  "user_id"
  end

  add_index "posters", ["organisation_id"], name: "index_posters_on_organisation_id", using: :btree
  add_index "posters", ["user_id"], name: "index_posters_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string   "name"
    t.string   "postcode"
    t.boolean  "expert"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.boolean  "under_18"
    t.boolean  "group"
    t.integer  "distance"
    t.decimal  "lat",        precision: 10, scale: 6
    t.decimal  "lng",        precision: 10, scale: 6
  end

  add_index "searches", ["user_id"], name: "index_searches_on_user_id", using: :btree

  create_table "searches_skills", id: false, force: :cascade do |t|
    t.integer "search_id", null: false
    t.integer "skill_id",  null: false
  end

  add_index "searches_skills", ["search_id"], name: "index_searches_skills_on_search_id", using: :btree
  add_index "searches_skills", ["skill_id"], name: "index_searches_skills_on_skill_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "alerts", "individuals"
  add_foreign_key "applications", "individuals"
  add_foreign_key "applications", "opportunities"
  add_foreign_key "individuals", "users"
  add_foreign_key "opportunities", "organisations"
  add_foreign_key "opportunities", "users"
  add_foreign_key "organisations", "classifications"
  add_foreign_key "posters", "organisations"
  add_foreign_key "posters", "users"
  add_foreign_key "searches", "users"
end
