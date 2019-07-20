class CreateVideoBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :video_blocks do |t|
      t.references :media_item, foreign_key: true
      t.references :media_item_mobile, foreign_key: { to_table: :media_items }
      t.boolean :autoplay, default: false, null: false
      t.integer :size
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('VideoBlock')
          BlockKind.create name: 'VideoBlock',
                           record_type: 'default',
                           category: 'default',
                           description: 'Add a video to the page.'
        end
      end

      change.down do
        BlockKind.where(name: 'VideoBlock').destroy_all
      end
    end
  end
end
