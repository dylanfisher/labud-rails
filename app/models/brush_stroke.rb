class BrushStroke < Forest::ApplicationRecord
  store :styles, accessors: [:transform, :border_radius, :width, :height]

  BG_COLORS = [
    '#2F2856',
    '#3E4555',
    '#ADB0B7',
    '#0A45C8',
    '#B26262',
    '#BD8C91'
  ]

  COLORS = [
    '#51005F',
    '#861148',
    '#756DF6',
    '#F3474D',
    '#D9B42C',
    '#0536A1',
    '#1F382D',
    '#FF78CA',
    '#24154C',
    '#FF4D05',
    '#E02F4F',
    '#10093F',
    '#0062AA',
    '#FFE191',
    '#FC576F',
    '#866329',
    '#FABDC3'
  ]

  scope :recent, -> { where('brush_strokes.created_at > ?', Time.now - 24.hours).order(created_at: :desc) }

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
