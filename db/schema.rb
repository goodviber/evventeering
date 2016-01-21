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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160118180945) do

  create_table "events", :force => true do |t|
    t.integer  "uri_id"
    t.date     "start_time"
    t.date     "end_time"
    t.string   "keywords"
    t.string   "title"
    t.string   "image_url"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "venue_id"
    t.string   "venue_name"
    t.string   "venue_address1"
    t.string   "venue_address2"
    t.string   "venue_town"
    t.string   "venue_country"
    t.string   "venue_postcode"
    t.float    "latitude"
    t.float    "longitude"
  end

end
