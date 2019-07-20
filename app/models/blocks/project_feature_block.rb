class ProjectFeatureBlock < BaseBlock
  has_many_ordered :media_item_1s, through: :project_feature_block_slide1s, source: :media_item, has_many_options: { source: :media_item }
  has_many_ordered :media_item_2s, through: :project_feature_block_slide2s, source: :media_item, has_many_options: { source: :media_item }
  has_many_ordered :media_item_3s, through: :project_feature_block_slide3s, source: :media_item, has_many_options: { source: :media_item }
  has_many_ordered :media_item_4s, through: :project_feature_block_slide4s, source: :media_item, has_many_options: { source: :media_item }

  belongs_to :project

  def self.permitted_params
    [
      :project_id, :text,
      media_item_1_ids: [],
      media_item_2_ids: [],
      media_item_3_ids: [],
      media_item_4_ids: []
    ]
  end

  def self.display_name
    'Project Feature Block'
  end

  # def self.display_icon
  #   'glyphicon glyphicon-align-left'
  # end
end
