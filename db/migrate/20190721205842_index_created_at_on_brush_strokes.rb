class IndexCreatedAtOnBrushStrokes < ActiveRecord::Migration[6.0]
  def change
    add_index :brush_strokes, :created_at
  end
end
