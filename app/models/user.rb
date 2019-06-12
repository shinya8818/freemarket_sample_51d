class User < ApplicationRecord
  has_one :address
  has_many :likes
  has_many :comments
  has_many :items
  has_many :sns_credentials, dependent: :destroy

  # *****会員情報入力画面*****
  validates :nickname,
            :email,
            :password,
            :password_confirmation,
            :last_name,
            :first_name,
            :last_name_kana,
            :first_name_kana,
            :birth_year,
            :birth_month,
            :birth_day, presence: true
  validates :email, uniqueness: true
  
  # *****電話認証画面*****
  validates :cell_phone, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present? #sns登録のみ完了してるユーザー
      # ログインさせる
      user = User.where(id: snscredential.user_id)
    else
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email
      )
    end
    return { user: user, sns: snscredential, uid: uid, provider:provider }
  end
end
