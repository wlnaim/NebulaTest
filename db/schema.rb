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

ActiveRecord::Schema.define(version: 20200429151839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dispersiones", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "prestamo_id"
    t.date     "fechaalta"
    t.float    "cantidad"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dispersions", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "prestamo_id"
    t.date     "fechaalta"
    t.float    "cantidad"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pagos", force: :cascade do |t|
    t.integer  "prestamo_id"
    t.float    "pago_interes"
    t.float    "pago_monto_periodico"
    t.date     "pago_fecha"
    t.float    "pago_capital"
    t.float    "pago_prestamo_saldo"
    t.integer  "pago_periodo"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "prestamos", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "plazo_prestamo"
    t.float    "interes_prestamo"
    t.float    "monto_prestamo"
    t.float    "monto_cubrir_prestamo"
    t.float    "pago_periodico_prestamo"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "is_dispersado"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "usuarios", force: :cascade do |t|
    t.text     "email"
    t.text     "password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "cuenta_bancaria"
    t.text     "primer_nombre"
    t.text     "primer_apellido"
  end

end
