# This migration comes from forest_engine (originally 20161219033747)
class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :title
      t.string :slug
      t.text :value
      t.text :description
      t.string :value_type, default: 'text'

      t.timestamps
    end
    add_index :settings, :slug, unique: true
  end
end
