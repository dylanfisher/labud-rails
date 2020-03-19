class AddDarkFeaturedMediaToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :dark_featured_media, :boolean, default: false, null: false
  end
end
