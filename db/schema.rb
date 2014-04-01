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

ActiveRecord::Schema.define(:version => 20140401203649) do

  create_table "encodes", :force => true do |t|
    t.string   "container"
    t.string   "size"
    t.string   "duration"
    t.string   "rip_date"
    t.string   "v_format"
    t.string   "v_profile"
    t.string   "v_codec"
    t.string   "resolution"
    t.string   "aspect_ratio"
    t.string   "v_bitrate"
    t.string   "framerate"
    t.string   "v_stream_size"
    t.string   "a_format"
    t.string   "a_bitrate"
    t.string   "a_stream_size"
    t.string   "movie_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "filename"
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "name"
    t.string   "content"
    t.string   "path"
    t.string   "ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "genres", :id => false, :force => true do |t|
    t.string   "id"
    t.string   "movie_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "movies", :force => true do |t|
    t.string   "backdrop_path"
    t.integer  "budget",         :limit => 255
    t.string   "imdb_id"
    t.string   "original_title"
    t.string   "overview"
    t.string   "popularity"
    t.string   "poster_path"
    t.string   "release_date"
    t.integer  "revenue",        :limit => 255
    t.integer  "runtime",        :limit => 255
    t.string   "status"
    t.string   "tagline"
    t.string   "title"
    t.float    "vote_average",   :limit => 255
    t.integer  "vote_count",     :limit => 255
    t.string   "filename"
    t.string   "added"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "requests", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "link"
    t.string   "ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "name"
    t.string   "content"
    t.integer  "number"
    t.boolean  "boolean"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shows", :force => true do |t|
    t.string   "backdrop_path"
    t.string   "original_name"
    t.string   "first_air_date"
    t.string   "poster_path"
    t.string   "popularity"
    t.string   "name"
    t.string   "vote_average"
    t.string   "vote_count"
    t.string   "overview"
    t.string   "folder"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
