class CollageBlockItem < ApplicationRecord
  belongs_to :media_item, touch: true
  belongs_to :collage_block, touch: true

  def css_styles
    styles = []
    styles << "width: #{collage_item_width}%"
    styles << "height: #{collage_item_height}%"
    styles << "top: #{collage_position_top}%"
    styles << "left: #{collage_position_left}%"
    styles << "z-index: #{collage_z_index}"
    styles.join('; ')
  end

  def size_to_use
    if media_item.try(:gif?)
      :original
    else
      :medium
    end
  end
end
