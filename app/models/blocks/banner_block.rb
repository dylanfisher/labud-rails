class BannerBlock < BaseBlock
  def self.permitted_params
    [:text, :link, :color]
  end

  def self.display_name
    'Banner Block'
  end

  # def self.display_icon
  #   'glyphicon glyphicon-align-left'
  # end
end
