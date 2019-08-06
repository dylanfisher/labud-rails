class CreateBannerBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :banner_blocks do |t|
      t.text :text
      t.string :link
      t.string :color
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('BannerBlock')
          BlockKind.create name: 'BannerBlock',
                           record_type: 'default',
                           category: 'default',
                           description: ''
        end
      end

      change.down do
        BlockKind.where(name: 'BannerBlock').destroy_all
      end
    end
  end
end
