# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_28_154537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cocktails", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "instructions", null: false
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_cocktails_on_name", unique: true
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_ingredients_on_name", unique: true
  end

  create_table "portions", id: false, force: :cascade do |t|
    t.bigint "cocktail_id", null: false
    t.bigint "ingredient_id", null: false
    t.string "measurement", null: false
    t.index ["cocktail_id", "ingredient_id"], name: "index_portions_on_cocktail_id_and_ingredient_id", unique: true
    t.index ["cocktail_id"], name: "index_portions_on_cocktail_id"
    t.index ["ingredient_id"], name: "index_portions_on_ingredient_id"
  end

end
