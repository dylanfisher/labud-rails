class CreateProjectFeatureBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :project_feature_blocks do |t|
      t.references :project, null: false, foreign_key: true
      t.text :text
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('ProjectFeatureBlock')
          BlockKind.create name: 'ProjectFeatureBlock',
                           record_type: 'default',
                           category: 'default',
                           description: 'Feature a project on the home page.'
        end
      end

      change.down do
        BlockKind.where(name: 'ProjectFeatureBlock').destroy_all
      end
    end
  end
end
