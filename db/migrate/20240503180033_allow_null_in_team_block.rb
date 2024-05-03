class AllowNullInTeamBlock < ActiveRecord::Migration[6.0]
  def change
    change_column_null :team_blocks, :media_item_1_id, true
    change_column_null :team_blocks, :media_item_2_id, true
  end
end
