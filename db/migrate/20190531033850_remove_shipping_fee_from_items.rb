class RemoveShippingFeeFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :shipping_fee, :string
  end
end
