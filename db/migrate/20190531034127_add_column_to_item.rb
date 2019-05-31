class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :method, :integer, null: false
    add_column :items, :shipping_fee, :integer, null: false
  end
end
