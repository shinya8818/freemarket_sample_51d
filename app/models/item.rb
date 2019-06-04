class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images, dependent: :destroy
  has_many :comments
  has_many :likes
  # active_hash
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture

  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank

  
  enum days: { "1~2日で発送": 0, "2~3日で発送": 1 , "4~7日で発送": 2}
  enum condition: { "新品、未使用": 0, "未使用に近い": 1, "目立った傷や汚れなし": 2, "やや傷や汚れあり": 3, "傷や汚れあり": 4, "全体的に状態が悪い": 5}
  enum status: { "販売中": 0, "売り切れ": 1}
  enum delivery: { "未定": 0, "らくらくメルカリ便": 1, "ゆうメール": 2, "レターパック": 3, "普通郵便(定形、定形外)": 4, "クロネコヤマト": 5, "ゆうパック": 6, "クリックポスト": 7, "ゆうパケット": 8}
  enum shipping_fee: { "送料込み(出品者負担)": 0, "着払い(購入者負担)": 1}

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :status, presence: true
  validates :fee, presence: true
  validates :condition, presence: true
  validates :delivery, presence: true
  validates :prefecture, presence: true
  validates :days, presence: true
  validates :user_id, presence: true
  validates :shipping_fee, presence: true
end
