class SmallTextBlock < BaseBlock
  validates_presence_of :text

  def self.permitted_params
    [:text]
  end

  def self.display_name
    'Small Text Block'
  end

  def self.display_icon
    'glyphicon glyphicon-align-left'
  end

  def css_class
    'mt-5'
  end
end
