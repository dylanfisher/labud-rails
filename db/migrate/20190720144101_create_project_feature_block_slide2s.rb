class CreateProjectFeatureBlockSlide2s < ActiveRecord::Migration[6.0]
  def change
    create_table :project_feature_block_slide2s do |t|
      t.references :project_feature_block, null: false, foreign_key: true
      t.references :media_item, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
