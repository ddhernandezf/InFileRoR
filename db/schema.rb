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

ActiveRecord::Schema.define(version: 0) do

  create_table "Customer", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "TaxNumber", limit: 10, :options => 'PRIMARY KEY'
    t.string "Firstname", limit: 150, null: false
    t.string "Lastname", limit: 150, null: false
    t.string "Address", limit: 45, null: false
  end

  create_table "InvoiceDetail", primary_key: "Id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "Header", null: false
    t.integer "Product", null: false
    t.integer "Quantity", limit: 2, null: false
    t.decimal "Price", precision: 18, scale: 2, null: false
    t.index ["Header"], name: "fk_InvHeader_InvDetail_idx"
    t.index ["Product"], name: "fk_InvDetail_Product_idx"
  end

  create_table "InvoiceHeader", primary_key: "Id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "State", limit: 1, null: false
    t.string "Customer", limit: 10, null: false
    t.datetime "InvoiceDateTime", null: false
    t.index ["Customer"], name: "fk_InvHeader_Customer_idx"
    t.index ["State"], name: "fk_InvHeader_InvState_idx"
  end

  create_table "InvoiceState", primary_key: "Id", id: :integer, limit: 1, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Name", limit: 15, null: false
  end

  create_table "Product", primary_key: "Id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Name", limit: 150, null: false
    t.decimal "CurrentPrice", precision: 18, scale: 2, null: false
  end

  add_foreign_key "InvoiceDetail", "InvoiceHeader", column: "Header", primary_key: "Id", name: "fk_InvDetail_InvHeader"
  add_foreign_key "InvoiceDetail", "Product", column: "Product", primary_key: "Id", name: "fk_InvDetail_Product"
  add_foreign_key "InvoiceHeader", "Customer", column: "Customer", primary_key: "TaxNumber", name: "fk_InvHeader_Customer"
  add_foreign_key "InvoiceHeader", "InvoiceState", column: "State", primary_key: "Id", name: "fk_InvHeader_InvState"
end
