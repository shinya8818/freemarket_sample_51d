class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string     :postal_code, null: false
      t.text       :prefecture, null: false
      t.string     :municipalities, null: false
      t.string     :address_number, null: false
      t.string     :building
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
