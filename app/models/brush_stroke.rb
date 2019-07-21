class BrushStroke < Forest::ApplicationRecord
  store :styles, accessors: [:transform, :border_radius, :width, :height]

  COLORS = [
    '#FD7B69',
    '#FDC6C7',
    '#BF9742',
    '#E0501F',
    '#FA7CCA',
    '#FFBF3E',
    '#DA081E',
    '#6B1F6A',
    '#825BBD',
    '#825BBD',
    '#5D191A',
    '#8A221B',
    '#218B5A',
    '#7F957E',
    '#D7CD40',
    '#80B94B',
    '#786DF1',
    '#63A3E5',
    '#63A3E5',
    '#4A58B0',
    '#4C6CE1',
    '#6B98AB',
    '#A8BCE4'
  ]

  # def self.resource_description
  #   'Briefly describe this resource.'
  # end

  def css_styles
    [
      "top: #{pos_y}%",
      "left: #{pos_x}%",
      "background-color: #{color}",
      "border-radius: #{border_radius}",
      "width: #{width}",
      "height: #{height}",
      "transform: #{transform}"
    ].join('; ') + ';'
  end
end
