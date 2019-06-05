# class CreateSnsCredentials < ActiveRecord::Migration[5.2]
#   def change
#     create_table :sns_credentials do |t|
#       t.string     :uid, null: false, unique: true
#       t.string     :provider, null: false
#       t.references :user, foreign_key: true, null: false
#       t.timestamps
#     end
#   end
# end
