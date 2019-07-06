class ImageBlock < BaseBlock
  belongs_to :media_item

  enum col_size: {
    one_half: 1,
    one_quarter: 0,
    three_quarters: 2,
    full_width: 3
  }, _prefix: :col_size

  enum col_offset: {
    none: 0,
    one_quarter: 1,
    one_half: 2,
    three_quarters: 3
  }, _prefix: :col_offset


  def self.permitted_params
    [:media_item_id, :col_size, :col_offset]
  end

  def self.display_name
    'Image Block'
  end

  def self.display_icon
    'glyphicon glyphicon-picture'
  end

  def columnable_css_class
    css_classes = []

    css_classes << 'columnable'

    # Column size
    case col_size
    when 'one_eighth'
      css_classes << 'col-md-2'
    when 'one_quarter'
      css_classes << 'col-md-3'
    when 'three_eighths'
      css_classes << 'col-md-4'
    when 'one_half'
      css_classes << 'col-md-6'
    when 'five_eighths'
      css_classes << 'col-md-8'
    when 'three_quarters'
      css_classes << 'col-md-9'
    when 'seven_eighths'
      css_classes << 'col-md-10'
    else
      css_classes << 'col-md-12'
    end

    # Column offset
    case col_offset
    when 'one_eighth'
      css_classes << 'offset-md-2'
    when 'one_quarter'
      css_classes << "offset-md-#{col_size == 'three_eighths' ? '4' : '3'}"
    when 'three_eighths'
      css_classes << "offset-md-#{col_size == 'five_eighths' ? '4' : '5'}"
    when 'one_half'
      css_classes << 'offset-md-6'
    when 'five_eighths'
      css_classes << 'offset-md-8'
    when 'three_quarters'
      css_classes << 'offset-md-9'
    when 'seven_eighths'
      css_classes << 'offset-md-10'
    end

    css_classes.join(' ')
  end
end
