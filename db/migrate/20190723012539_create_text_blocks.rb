class CreateTextBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :text_blocks do |t|
      t.text :text
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('TextBlock')
          BlockKind.create name: 'TextBlock',
                           record_type: 'default',
                           category: 'default',
                           description: 'Larger sized text block.'
        end
      end

      change.down do
        BlockKind.where(name: 'TextBlock').destroy_all
      end
    end
  end
end
