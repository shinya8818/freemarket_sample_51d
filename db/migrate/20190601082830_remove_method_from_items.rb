class RemoveMethodFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :method, :sting
  end
end
