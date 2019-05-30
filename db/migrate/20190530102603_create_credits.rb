class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.string     :card_number, null: false
      t.text       :security, null: false
      t.integer    :deadline_year, null:false
      t.integer    :deadline_month, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
