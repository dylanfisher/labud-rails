class CreateMultiColumnTextBlockItems < ActiveRecord::Migration[6.0]
  def change
    create_table :multi_column_text_block_items do |t|
      t.references :multi_column_text_block, null: false, foreign_key: true, index: { name: 'index_mult_col_text_block_items_on_mult_col_text_block_id' }
      t.integer :position
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
