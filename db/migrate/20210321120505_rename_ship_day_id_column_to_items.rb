class RenameShipDayIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :ship_day_id, :ShipDate_id

  end
end
