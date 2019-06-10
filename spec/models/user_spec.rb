require 'rails_helper'
describe User do
  # *****会員情報入力画面*****
  describe '#user_info_keep' do
    # ニックネーム
    it 'is invalid without a nickname' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    # メールアドレス
    it 'is invalid without a email' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    # パスワード
    it 'is invalid without a password' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    # パスワード(確認用)
    it 'is invalid without a password_confirmation' do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end
    # 姓
    it 'is invalid without a last_name' do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    # 名
    it 'is invalid without a first_name' do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    # 姓（カナ）
    it 'is invalid without a first_name_kana' do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end
    # 名（カナ）
    it 'is invalid without a last_name_kana' do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end
    # 生年月日（年）
    it 'is invalid without a birth_year' do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end
    # 生年月日（月）
    it 'is invalid without a birth_month' do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end    
    # 生年月日（日）
    it 'is invalid without a birth_day' do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end    
  end

  # *****電話認証画面*****
  describe '#phone_info_keep' do
    # 電話番号
    it  'is invalid without a cell_phone' do
      user = build(:user, cell_phone: nil)
      user.valid?
      expect(user.errors[:cell_phone]).to include("can't be blank")
    end
  end
end