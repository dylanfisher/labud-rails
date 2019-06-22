class CreateTitleBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :title_blocks do |t|
      t.string :title
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('TitleBlock')
          BlockKind.create name: 'TitleBlock',
                           record_type: 'default',
                           category: 'default',
                           description: 'Add a title to introduce a new section.'
        end
      end

      change.down do
        BlockKind.where(name: 'TitleBlock').destroy_all
      end
    end
  end
end
