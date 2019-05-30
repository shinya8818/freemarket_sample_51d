class User < ApplicationRecord
  has_one :adress
  has_one :creadit
  has_many :likes
  has_many :comments
  has_many :items
  has_many :sns_credentials
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
