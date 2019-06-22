class Project < Forest::ApplicationRecord
  include Blockable
  include Sluggable
  include Statusable

  belongs_to :media_item

  # def self.resource_description
  #   'Briefly describe this resource.'
  # end
end
