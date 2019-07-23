class CreatePebbleBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :pebble_blocks do |t|
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('PebbleBlock')
          BlockKind.create name: 'PebbleBlock',
                           record_type: 'default',
                           category: 'default',
                           description: 'Like a divider block, but a pebble.'
        end
      end

      change.down do
        BlockKind.where(name: 'PebbleBlock').destroy_all
      end
    end
  end
end
