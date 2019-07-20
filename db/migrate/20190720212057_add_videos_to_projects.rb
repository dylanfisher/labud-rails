class AddVideosToProjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :video_item, foreign_key: { to_table: :media_items }
    add_reference :projects, :video_item_mobile, foreign_key: { to_table: :media_items }
  end
end
