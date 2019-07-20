class ProjectFeatureBlockSlide4 < ApplicationRecord
  belongs_to :project_feature_block, optional: true
  belongs_to :media_item, optional: true
end
