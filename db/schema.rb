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

ActiveRecord::Schema.define(version: 20130830230724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenge_results", force: true do |t|
    t.integer  "team_id"
    t.integer  "challenge_id"
    t.integer  "placement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenges", force: true do |t|
    t.integer  "order_number"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stage_results", force: true do |t|
    t.integer  "team_id"
    t.integer  "stage_id"
    t.integer  "placement"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.integer  "start_odometer"
    t.integer  "finish_odometer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "workflow_state"
  end

  create_table "stages", force: true do |t|
    t.integer  "order_number"
    t.integer  "ideal_time"
    t.float    "pax_percent"
    t.string   "stage_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "driver"
    t.string   "navigator"
    t.string   "vehicle"
    t.float    "pax"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
