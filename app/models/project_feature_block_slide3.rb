class ProjectFeatureBlockSlide3 < ApplicationRecord
  belongs_to :project_feature_block, optional: true
  belongs_to :media_item, optional: true
end
