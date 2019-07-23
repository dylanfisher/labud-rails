class MultiColumnTextBlock < BaseBlock
  has_many :multi_column_text_block_items, -> { order(:position) }, dependent: :destroy, inverse_of: :multi_column_text_block
  accepts_nested_attributes_for :multi_column_text_block_items, reject_if: :all_blank, allow_destroy: true

  def self.permitted_params
    [
      multi_column_text_block_items_attributes:
        [:_destroy, :id, :position, :title, :text]
    ]
  end

  def self.display_name
    'Multi Column Text Block'
  end

  def self.display_icon
    'glyphicon glyphicon-align-left'
  end
end
