class ChangeDatatypePrefectureOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :Items, :prefecture, :int
  end
end
