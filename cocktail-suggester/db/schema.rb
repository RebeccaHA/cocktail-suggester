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

ActiveRecord::Schema.define(version: 20200403101016) do

  create_table "cocktails", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.string  "ingredients"
    t.string  "garnish"
    t.string  "glassware"
    t.integer "method_time"
    t.integer "ingredient_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string  "ingredient_slot_1"
    t.string  "ingredient_slot_2"
    t.string  "ingredient_slot_3"
    t.string  "ingredient_slot_4"
    t.string  "ingredient_slot_5"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "favourite_cocktail"
  end

end
