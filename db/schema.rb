# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_05_03_180033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banner_blocks", force: :cascade do |t|
    t.text "text"
    t.string "link"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "base_blocks", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "block_kinds", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "record_type"
    t.index ["category"], name: "index_block_kinds_on_category"
    t.index ["name"], name: "index_block_kinds_on_name", unique: true
    t.index ["record_type"], name: "index_block_kinds_on_record_type"
  end

  create_table "block_layouts", force: :cascade do |t|
    t.string "slug"
    t.string "display_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_block_layouts_on_slug", unique: true
  end

  create_table "block_slots", id: :serial, force: :cascade do |t|
    t.string "block_type"
    t.integer "block_id"
    t.integer "block_kind_id"
    t.string "block_record_type"
    t.integer "block_record_id"
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "block_layout_id"
    t.index ["block_kind_id"], name: "index_block_slots_on_block_kind_id"
    t.index ["block_layout_id"], name: "index_block_slots_on_block_layout_id"
    t.index ["block_record_type", "block_record_id"], name: "index_block_slots_on_block_record_type_and_block_record_id"
    t.index ["block_type", "block_id"], name: "index_block_slots_on_block_type_and_block_id"
  end

  create_table "brush_strokes", force: :cascade do |t|
    t.float "pos_x"
    t.float "pos_y"
    t.string "color"
    t.string "ip_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "styles"
    t.index ["created_at"], name: "index_brush_strokes_on_created_at"
  end

  create_table "cache_records", id: :serial, force: :cascade do |t|
    t.integer "cacheable_id"
    t.string "cacheable_type"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cacheable_type", "cacheable_id"], name: "index_cache_records_on_type_and_id"
  end

  create_table "code_blocks", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collage_block_items", force: :cascade do |t|
    t.bigint "media_item_id", null: false
    t.bigint "collage_block_id", null: false
    t.decimal "collage_position_left"
    t.decimal "collage_position_top"
    t.decimal "collage_item_width"
    t.decimal "collage_item_height"
    t.integer "collage_z_index"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collage_block_id"], name: "index_collage_block_items_on_collage_block_id"
    t.index ["media_item_id"], name: "index_collage_block_items_on_media_item_id"
  end

  create_table "collage_blocks", force: :cascade do |t|
    t.decimal "collage_height_ratio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "divider_blocks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "image_blocks", force: :cascade do |t|
    t.bigint "media_item_id", null: false
    t.integer "col_size"
    t.integer "col_offset"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_item_id"], name: "index_image_blocks_on_media_item_id"
  end

  create_table "image_pair_blocks", force: :cascade do |t|
    t.bigint "media_item_id", null: false
    t.bigint "media_item_two_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_item_id"], name: "index_image_pair_blocks_on_media_item_id"
    t.index ["media_item_two_id"], name: "index_image_pair_blocks_on_media_item_two_id"
  end

  create_table "large_image_blocks", force: :cascade do |t|
    t.bigint "media_item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_item_id"], name: "index_large_image_blocks_on_media_item_id"
  end

  create_table "media_items", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "caption"
    t.string "alternative_text"
    t.text "description"
    t.text "dimensions"
    t.string "attachment_file_name"
    t.string "attachment_content_type"
    t.bigint "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "media_item_status", default: 0
    t.index ["attachment_content_type"], name: "index_media_items_on_attachment_content_type"
    t.index ["created_at"], name: "index_media_items_on_created_at"
    t.index ["media_item_status"], name: "index_media_items_on_media_item_status"
    t.index ["slug"], name: "index_media_items_on_slug", unique: true
  end

  create_table "menus", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "structure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_menus_on_slug", unique: true
  end

  create_table "multi_column_text_block_items", force: :cascade do |t|
    t.bigint "multi_column_text_block_id", null: false
    t.integer "position"
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["multi_column_text_block_id"], name: "index_mult_col_text_block_items_on_mult_col_text_block_id"
  end

  create_table "multi_column_text_blocks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "path"
    t.integer "status", default: 1, null: false
    t.datetime "scheduled_date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "featured_image_id"
    t.integer "parent_page_id"
    t.string "redirect"
    t.jsonb "blockable_metadata", default: {}
    t.string "seo_title"
    t.index ["blockable_metadata"], name: "index_pages_on_blockable_metadata", using: :gin
    t.index ["featured_image_id"], name: "index_pages_on_featured_image_id"
    t.index ["parent_page_id"], name: "index_pages_on_parent_page_id"
    t.index ["path"], name: "index_pages_on_path", unique: true
    t.index ["slug"], name: "index_pages_on_slug"
    t.index ["status"], name: "index_pages_on_status"
  end

  create_table "pebble_blocks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_feature_block_slide1s", force: :cascade do |t|
    t.bigint "project_feature_block_id", null: false
    t.bigint "media_item_id", null: false
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_item_id"], name: "index_project_feature_block_slide1s_on_media_item_id"
    t.index ["project_feature_block_id"], name: "index_project_feature_block_slide1s_on_project_feature_block_id"
  end

  create_table "project_feature_block_slide2s", force: :cascade do |t|
    t.bigint "project_feature_block_id", null: false
    t.bigint "media_item_id", null: false
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_item_id"], name: "index_project_feature_block_slide2s_on_media_item_id"
    t.index ["project_feature_block_id"], name: "index_project_feature_block_slide2s_on_project_feature_block_id"
  end

  create_table "project_feature_block_slide3s", force: :cascade do |t|
    t.bigint "project_feature_block_id", null: false
    t.bigint "media_item_id", null: false
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_item_id"], name: "index_project_feature_block_slide3s_on_media_item_id"
    t.index ["project_feature_block_id"], name: "index_project_feature_block_slide3s_on_project_feature_block_id"
  end

  create_table "project_feature_block_slide4s", force: :cascade do |t|
    t.bigint "project_feature_block_id", null: false
    t.bigint "media_item_id", null: false
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_item_id"], name: "index_project_feature_block_slide4s_on_media_item_id"
    t.index ["project_feature_block_id"], name: "index_project_feature_block_slide4s_on_project_feature_block_id"
  end

  create_table "project_feature_blocks", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_feature_blocks_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "description"
    t.text "metadata"
    t.bigint "media_item_id"
    t.string "slug"
    t.integer "status", default: 1, null: false
    t.jsonb "blockable_metadata", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "page_color"
    t.string "url"
    t.bigint "video_item_id"
    t.bigint "video_item_mobile_id"
    t.boolean "dark_featured_media", default: false, null: false
    t.index ["blockable_metadata"], name: "index_projects_on_blockable_metadata", using: :gin
    t.index ["media_item_id"], name: "index_projects_on_media_item_id"
    t.index ["slug"], name: "index_projects_on_slug", unique: true
    t.index ["status"], name: "index_projects_on_status"
    t.index ["video_item_id"], name: "index_projects_on_video_item_id"
    t.index ["video_item_mobile_id"], name: "index_projects_on_video_item_mobile_id"
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "value"
    t.text "description"
    t.string "value_type", default: "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale"
    t.index ["locale", "slug"], name: "index_settings_on_locale_and_slug", unique: true
    t.index ["locale"], name: "index_settings_on_locale"
  end

  create_table "small_text_blocks", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_blocks", force: :cascade do |t|
    t.bigint "media_item_1_id"
    t.bigint "media_item_2_id"
    t.string "title_1"
    t.string "title_2"
    t.string "url_1"
    t.string "url_2"
    t.text "column_1"
    t.text "column_2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_item_1_id"], name: "index_team_blocks_on_media_item_1_id"
    t.index ["media_item_2_id"], name: "index_team_blocks_on_media_item_2_id"
  end

  create_table "text_blocks", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "title_blocks", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "translations", force: :cascade do |t|
    t.string "key", null: false
    t.text "value", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_translations_on_key", unique: true
  end

  create_table "user_groups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_user_groups_on_name", unique: true
  end

  create_table "user_groups_users", id: false, force: :cascade do |t|
    t.integer "user_group_id", null: false
    t.integer "user_id", null: false
    t.index ["user_group_id", "user_id"], name: "index_user_groups_users_on_user_group_id_and_user_id"
    t.index ["user_id", "user_group_id"], name: "index_user_groups_users_on_user_id_and_user_group_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "slug"
    t.text "settings", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  create_table "video_blocks", force: :cascade do |t|
    t.bigint "media_item_id"
    t.bigint "media_item_mobile_id"
    t.boolean "autoplay", default: false, null: false
    t.integer "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_item_id"], name: "index_video_blocks_on_media_item_id"
    t.index ["media_item_mobile_id"], name: "index_video_blocks_on_media_item_mobile_id"
  end

  add_foreign_key "block_slots", "block_kinds"
  add_foreign_key "block_slots", "block_layouts"
  add_foreign_key "collage_block_items", "collage_blocks"
  add_foreign_key "collage_block_items", "media_items"
  add_foreign_key "image_blocks", "media_items"
  add_foreign_key "image_pair_blocks", "media_items"
  add_foreign_key "image_pair_blocks", "media_items", column: "media_item_two_id"
  add_foreign_key "large_image_blocks", "media_items"
  add_foreign_key "multi_column_text_block_items", "multi_column_text_blocks"
  add_foreign_key "project_feature_block_slide1s", "media_items"
  add_foreign_key "project_feature_block_slide1s", "project_feature_blocks"
  add_foreign_key "project_feature_block_slide2s", "media_items"
  add_foreign_key "project_feature_block_slide2s", "project_feature_blocks"
  add_foreign_key "project_feature_block_slide3s", "media_items"
  add_foreign_key "project_feature_block_slide3s", "project_feature_blocks"
  add_foreign_key "project_feature_block_slide4s", "media_items"
  add_foreign_key "project_feature_block_slide4s", "project_feature_blocks"
  add_foreign_key "project_feature_blocks", "projects"
  add_foreign_key "projects", "media_items"
  add_foreign_key "projects", "media_items", column: "video_item_id"
  add_foreign_key "projects", "media_items", column: "video_item_mobile_id"
  add_foreign_key "team_blocks", "media_items", column: "media_item_1_id"
  add_foreign_key "team_blocks", "media_items", column: "media_item_2_id"
  add_foreign_key "video_blocks", "media_items"
  add_foreign_key "video_blocks", "media_items", column: "media_item_mobile_id"
end
