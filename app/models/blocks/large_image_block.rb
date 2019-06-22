class LargeImageBlock < BaseBlock
  belongs_to :media_item

  def self.permitted_params
    [:media_item_id]
  end

  def self.display_name
    'Large Image Block'
  end

  def self.display_icon
    'glyphicon glyphicon-picture'
  end
end
