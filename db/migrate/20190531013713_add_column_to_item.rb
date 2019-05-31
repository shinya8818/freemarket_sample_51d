class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :shipping_fee, :string, null: false
  end
end
