# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100315113437) do

  create_table "form_data_sets", :force => true do |t|
    t.string   "email"
    t.integer  "form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form_datas", :force => true do |t|
    t.integer  "form_id"
    t.integer  "form_element_id"
    t.integer  "int_value"
    t.string   "slim_value"
    t.text     "fat_value"
    t.text     "hash_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "form_data_set_id"
  end

  create_table "form_elements", :force => true do |t|
    t.string   "field_type"
    t.string   "label"
    t.boolean  "required"
    t.text     "help"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form_group_assignments", :force => true do |t|
    t.integer  "form_group_id"
    t.integer  "form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form_groups", :force => true do |t|
    t.string   "label"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forms", :force => true do |t|
    t.string   "title"
    t.text     "description", :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_element_assignments", :force => true do |t|
    t.integer  "form_group_id"
    t.integer  "form_element_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
