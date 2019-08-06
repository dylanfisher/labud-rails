class CreateTeamBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :team_blocks do |t|
      t.references :media_item_1, null: false, foreign_key: { to_table: :media_items }
      t.references :media_item_2, null: false, foreign_key: { to_table: :media_items }
      t.string :title_1
      t.string :title_2
      t.string :url_1
      t.string :url_2
      t.text :column_1
      t.text :column_2
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('TeamBlock')
          BlockKind.create name: 'TeamBlock',
                           record_type: 'default',
                           category: 'default',
                           description: 'Highlight our team members!'
        end
      end

      change.down do
        BlockKind.where(name: 'TeamBlock').destroy_all
      end
    end
  end
end
