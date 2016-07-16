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

ActiveRecord::Schema.define(version: 20160716051429) do

  create_table "formbuilder_entry_attachments", force: :cascade do |t|
    t.string   "upload",       limit: 255
    t.string   "content_type", limit: 255
    t.integer  "file_size",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formbuilder_forms", force: :cascade do |t|
    t.integer  "formable_id",   limit: 4
    t.string   "formable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formbuilder_response_fields", force: :cascade do |t|
    t.integer  "form_id",       limit: 4
    t.text     "label",         limit: 65535
    t.string   "type",          limit: 255
    t.text     "field_options", limit: 65535
    t.integer  "sort_order",    limit: 4
    t.boolean  "required",                    default: false
    t.boolean  "blind",                       default: false
    t.boolean  "admin_only",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "note_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id",   limit: 4
    t.string  "unsubscriber_type", limit: 255
    t.integer "conversation_id",   limit: 4
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    limit: 255, default: ""
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type",                 limit: 255
    t.text     "body",                 limit: 65535
    t.string   "subject",              limit: 255,   default: ""
    t.integer  "sender_id",            limit: 4
    t.string   "sender_type",          limit: 255
    t.integer  "conversation_id",      limit: 4
    t.boolean  "draft",                              default: false
    t.string   "notification_code",    limit: 255
    t.integer  "notified_object_id",   limit: 4
    t.string   "notified_object_type", limit: 255
    t.string   "attachment",           limit: 255
    t.datetime "updated_at",                                         null: false
    t.datetime "created_at",                                         null: false
    t.boolean  "global",                             default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id",     limit: 4
    t.string   "receiver_type",   limit: 255
    t.integer  "notification_id", limit: 4,                   null: false
    t.boolean  "is_read",                     default: false
    t.boolean  "trashed",                     default: false
    t.boolean  "deleted",                     default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "notes", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "content",     limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "price",       limit: 255
    t.text     "image_1",     limit: 65535
    t.text     "image_2",     limit: 65535
    t.text     "image_3",     limit: 65535
    t.string   "category",    limit: 255
    t.text     "rule",        limit: 65535
    t.string   "user_id",     limit: 255
    t.string   "provider_id", limit: 255
    t.string   "catchcopy",   limit: 255
    t.string   "salespoint",  limit: 255
    t.string   "cancelrule",  limit: 255
  end

  create_table "providers", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "storename",              limit: 255
    t.string   "phonenumber",            limit: 255
    t.string   "address",                limit: 255
    t.string   "hours",                  limit: 255
    t.string   "holiday",                limit: 255
    t.string   "payment",                limit: 255
    t.string   "provider_pic",           limit: 255
    t.string   "about",                  limit: 255
  end

  add_index "providers", ["email"], name: "index_providers_on_email", unique: true, using: :btree
  add_index "providers", ["reset_password_token"], name: "index_providers_on_reset_password_token", unique: true, using: :btree

  create_table "service_providers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.text     "profile_pic",            limit: 65535
    t.text     "profile",                limit: 65535
    t.string   "area",                   limit: 255
    t.string   "user_name",              limit: 255
    t.integer  "uid",                    limit: 8
    t.string   "provider",               limit: 255
    t.string   "token",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
end
