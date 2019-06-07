class AddStatusToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :status, :integer, null: false, default: 0
  end
end
