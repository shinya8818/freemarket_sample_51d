class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name, null:false
      t.string     :description, null:false
      t.string     :brand
      t.integer    :status, null: false
      t.integer    :fee, null: false
      t.integer    :condition, null: false
      t.string     :method, null: false
      t.string     :prefecture, null:false
      t.integer    :days, null:false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
