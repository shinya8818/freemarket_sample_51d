# class AddColumnToUser < ActiveRecord::Migration[5.2]
#   def change

#     add_column :users, :nickname, :string, null: false
#     add_column :users, :sex, :string
#     add_column :users, :last_name, :string, null: false
#     add_column :users, :first_name, :string, null: false
#     add_column :users, :last_name_kana, :string, null: false
#     add_column :users, :first_name_kana, :string, null: false
#     add_column :users, :birth_year, :string
#     add_column :users, :birth_month, :string
#     add_column :users, :birth_day, :string
#     add_column :users, :cell_phone, :string, null: false, unique: true
#     add_column :users, :avatar, :string
#     add_column :users, :profile, :text
#   end
# end
