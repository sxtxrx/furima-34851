class RenameShipCostIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :ship_cost_id, :shippingfee_id

  end
end
