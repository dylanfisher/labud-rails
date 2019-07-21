class CreateBrushStrokes < ActiveRecord::Migration[6.0]
  def change
    create_table :brush_strokes do |t|
      t.float :pos_x
      t.float :pos_y
      t.string :color
      t.string :ip_address

      t.timestamps
    end
  end
end
