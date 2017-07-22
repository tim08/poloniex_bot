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

ActiveRecord::Schema.define(version: 20170720115225) do

  create_table "exchanges", force: :cascade do |t|
    t.integer "ex_type"
    t.string "last_price"
    t.string "lowest_ask"
    t.string "highest_bid"
    t.string "percent_change"
    t.string "base_volume"
    t.string "quote_volume"
    t.string "high24hr"
    t.string "low24hr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sell_orders"
    t.string "buy_orders"
    t.float "count_in_btc"
    t.string "name"
  end

end
