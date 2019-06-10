class Address < ApplicationRecord
  belongs_to :user

  # *****住所入力画面*****
  validates :last_name,
            :first_name,
            :last_name_kana,
            :first_name_kana,
            :postal_code,
            :prefecture,
            :municipalities,
            :address_number, presence: true
end
