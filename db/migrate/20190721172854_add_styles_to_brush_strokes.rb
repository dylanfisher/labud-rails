class AddStylesToBrushStrokes < ActiveRecord::Migration[6.0]
  def change
    add_column :brush_strokes, :styles, :text
  end
end
