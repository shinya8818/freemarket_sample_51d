class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :size, :string
    add_column :items, :delivery, :integer, null: false
  end
end
