class MultiColumnTextBlockItem < ApplicationRecord
  belongs_to :multi_column_text_block, inverse_of: :multi_column_text_block_items, touch: true
end
