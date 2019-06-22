class CreateImagePairBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :image_pair_blocks do |t|
      t.references :media_item, null: false, foreign_key: true
      t.references :media_item_two, null: false, foreign_key: { to_table: :media_items }
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('ImagePairBlock')
          BlockKind.create name: 'ImagePairBlock',
                           record_type: 'default',
                           category: 'default',
                           description: 'A pair of images.'
        end
      end

      change.down do
        BlockKind.where(name: 'ImagePairBlock').destroy_all
      end
    end
  end
end
