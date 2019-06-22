class CodeBlock < BaseBlock
  validates_presence_of :text

  def self.permitted_params
    [:text]
  end

  def self.display_name
    'Code Block'
  end

  # def self.display_icon
  #   'glyphicon glyphicon-align-left'
  # end
end
