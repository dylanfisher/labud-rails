class CreateMultiColumnTextBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :multi_column_text_blocks do |t|
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('MultiColumnTextBlock')
          BlockKind.create name: 'MultiColumnTextBlock',
                           record_type: 'default',
                           category: 'default',
                           description: 'Multiple columns of text.'
        end
      end

      change.down do
        BlockKind.where(name: 'MultiColumnTextBlock').destroy_all
      end
    end
  end
end
