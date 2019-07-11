class Project < Forest::ApplicationRecord
  include Blockable
  include Sluggable
  include Statusable

  belongs_to :media_item

  def self.resource_description
    'Labud\'s projects!'
  end
end
