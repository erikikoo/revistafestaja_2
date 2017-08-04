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

ActiveRecord::Schema.define(version: 20170801221234) do

  create_table "cliente_segmentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cliente_id"
    t.integer  "segmento_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["cliente_id"], name: "index_cliente_segmentos_on_cliente_id", using: :btree
    t.index ["segmento_id"], name: "index_cliente_segmentos_on_segmento_id", using: :btree
  end

  create_table "clientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "responsavel"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "publicar",     default: false
    t.string   "razao_social"
    t.string   "banner"
  end

  create_table "contatos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "numero",     limit: 15
    t.boolean  "whatsapp",              default: false
    t.integer  "cliente_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["cliente_id"], name: "index_contatos_on_cliente_id", using: :btree
  end

  create_table "enderecos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "end"
    t.string   "numero",      limit: 4
    t.string   "complemento"
    t.integer  "cliente_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["cliente_id"], name: "index_enderecos_on_cliente_id", using: :btree
  end

  create_table "forma_pagamentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parcelas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "venda_id"
    t.float    "valor",      limit: 24
    t.date     "vencimento"
    t.boolean  "status",                default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["venda_id"], name: "index_parcelas_on_venda_id", using: :btree
  end

  create_table "produto_valors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "produto_id"
    t.integer  "valor_id"
    t.date     "mes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_produto_valors_on_produto_id", using: :btree
    t.index ["valor_id"], name: "index_produto_valors_on_valor_id", using: :btree
  end

  create_table "produtos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "descricao",  limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "segmentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "name"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "valors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "preco",      limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "venda_produtos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "venda_id"
    t.integer  "produto_id"
    t.integer  "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_venda_produtos_on_produto_id", using: :btree
    t.index ["venda_id"], name: "index_venda_produtos_on_venda_id", using: :btree
  end

  create_table "vendas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "cliente_id"
    t.string   "edicao"
    t.float    "valor_total",        limit: 24
    t.integer  "desconto"
    t.string   "codigo",             limit: 11
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "forma_pagamento_id"
    t.index ["cliente_id"], name: "index_vendas_on_cliente_id", using: :btree
    t.index ["forma_pagamento_id"], name: "index_vendas_on_forma_pagamento_id", using: :btree
    t.index ["user_id"], name: "index_vendas_on_user_id", using: :btree
  end

  add_foreign_key "cliente_segmentos", "clientes"
  add_foreign_key "cliente_segmentos", "segmentos"
  add_foreign_key "contatos", "clientes"
  add_foreign_key "enderecos", "clientes"
  add_foreign_key "parcelas", "vendas"
  add_foreign_key "produto_valors", "produtos"
  add_foreign_key "produto_valors", "valors"
  add_foreign_key "venda_produtos", "produtos"
  add_foreign_key "venda_produtos", "vendas"
  add_foreign_key "vendas", "clientes"
  add_foreign_key "vendas", "forma_pagamentos"
  add_foreign_key "vendas", "users"
end
