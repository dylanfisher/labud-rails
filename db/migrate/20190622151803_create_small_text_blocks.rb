class CreateSmallTextBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :small_text_blocks do |t|
      t.text :text
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('SmallTextBlock')
          BlockKind.create name: 'SmallTextBlock',
                           record_type: 'default',
                           category: 'default',
                           description: 'Small block of text.'
        end
      end

      change.down do
        BlockKind.where(name: 'SmallTextBlock').destroy_all
      end
    end
  end
end
