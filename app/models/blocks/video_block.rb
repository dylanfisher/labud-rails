class VideoBlock < BaseBlock
  belongs_to :media_item
  belongs_to :media_item_mobile, class_name: 'MediaItem', optional: true

  enum size: {
    one_half: 1,
    one_quarter: 0,
    three_quarters: 2,
    full_width: 3
  }

  def self.permitted_params
    [:media_item_id, :media_item_mobile_id, :autoplay, :size]
  end

  def self.display_name
    'Video Block'
  end

  def self.display_icon
    'glyphicon glyphicon-play'
  end

  def columnable_css_class
    css_classes = []

    case size
    when 'one_half'
      css_classes << 'col-sm-6 offset-sm-3'
    when 'one_quarter'
      css_classes << 'col-sm-4 offset-sm-4'
    when 'three_quarters'
      css_classes << 'col-sm-8 offset-sm-2'
    else
      css_classes << 'col-sm-12'
    end

    css_classes.join(' ')
  end
end
