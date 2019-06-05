class AddShippingfeeToItmes < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :shipping_fee, :integer
  end
end
