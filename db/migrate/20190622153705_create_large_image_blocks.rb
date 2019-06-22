class CreateLargeImageBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :large_image_blocks do |t|
      t.references :media_item, null: false, foreign_key: true
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('LargeImageBlock')
          BlockKind.create name: 'LargeImageBlock',
                           record_type: 'default',
                           category: 'default',
                           description: 'Large, full bleed image.'
        end
      end

      change.down do
        BlockKind.where(name: 'LargeImageBlock').destroy_all
      end
    end
  end
end
