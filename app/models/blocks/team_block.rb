class TeamBlock < BaseBlock
  belongs_to :media_item_1, class_name: 'MediaItem'
  belongs_to :media_item_2, class_name: 'MediaItem'

  def self.permitted_params
    [:media_item_1_id, :media_item_2_id, :title_1, :title_2, :url_1, :url_2, :column_1, :column_2]
  end

  def self.display_name
    'Team Block'
  end

  # def self.display_icon
  #   'glyphicon glyphicon-align-left'
  # end
end
