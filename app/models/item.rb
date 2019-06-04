class Item < ApplicationRecord
  belongs_to :user
  has_many :categories
  has_many :images, dependent: :destroy
  has_many :comments
  has_many :likes
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :categories

  enum days: {"---": "","1~2日で発送": 0, "2~3日で発送": 1 , "4~7日で発送": 2}
end
