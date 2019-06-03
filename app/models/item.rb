class Item < ApplicationRecord
  belongs_to :user
  has_many :categories
  has_many :images, dependent: :destroy
  has_many :comments
  has_many :likes
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :categories
end
