class Address < ApplicationRecord
  belongs_to :user

  # *****住所入力画面*****
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :municipalities, presence: true
  validates :address_number, presence: true
end
