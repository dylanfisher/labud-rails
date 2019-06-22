class ImagePairBlock < BaseBlock
  belongs_to :media_item
  belongs_to :media_item_two, class_name: 'MediaItem'

  def self.permitted_params
    [:media_item_id, :media_item_two_id]
  end

  def self.display_name
    'Image Pair Block'
  end

  def self.display_icon
    'glyphicon glyphicon-picture'
  end
end
