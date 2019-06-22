class AddPageColorToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :page_color, :string
  end
end
