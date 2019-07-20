class Project < Forest::ApplicationRecord
  include Blockable
  include Sluggable
  include Statusable

  belongs_to :media_item
  belongs_to :video_item, class_name: 'MediaItem', optional: true
  belongs_to :video_item_mobile, class_name: 'MediaItem', optional: true

  def self.resource_description
    'Labud\'s projects!'
  end

  def pretty_website_url
    URI.parse(url).host.sub(/^www\./, '') unless url.blank?
  end
end
