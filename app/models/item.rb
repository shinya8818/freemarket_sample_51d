class Item < ApplicationRecord
  belongs_to :user
  has_many :categories
  has_many :images
  has_many :comments
  has_many :likes
end
