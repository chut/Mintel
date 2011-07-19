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

ActiveRecord::Schema.define(:version => 20110702201503) do

  create_table "miners", :force => true do |t|
    t.integer  "mintelid"
    t.datetime "time"
    t.integer  "miner_num"
    t.string   "miner_name"
    t.float    "hash_rate"
    t.integer  "round_shares"
    t.integer  "round_stales"
    t.integer  "reset_shares"
    t.integer  "reset_stales"
    t.integer  "total_shares"
    t.time     "last_share"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rewards", :force => true do |t|
    t.datetime "time"
    t.float    "confirmed_reward"
    t.float    "estimated_rewards"
    t.float    "payouts"
    t.float    "unconfirmed_rewards"
    t.time     "last_share"
    t.float    "pool_hash_rate"
    t.time     "round_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
