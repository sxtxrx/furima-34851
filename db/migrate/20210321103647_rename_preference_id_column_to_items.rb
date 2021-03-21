class RenamePreferenceIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :preference_id, :prefecture_id

  end
end
