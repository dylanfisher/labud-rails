class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.text :metadata
      t.references :media_item, foreign_key: true
      t.string :slug
      t.integer :status, default: 1, null: false
      t.jsonb :blockable_metadata, default: {}

      t.timestamps
    end
    add_index :projects, :slug, unique: true
    add_index :projects, :status
    add_index :projects, :blockable_metadata, using: :gin
  end
end
