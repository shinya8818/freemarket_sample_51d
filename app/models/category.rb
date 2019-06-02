class Category < ApplicationRecord
  belongs_to :item

  validates :name, presence: true
  validates :item_id, presence: true
end
