class AddDeliveryToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :delivery, :integer, null: false
  end
end
