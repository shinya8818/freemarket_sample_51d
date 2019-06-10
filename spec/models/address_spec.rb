require 'rails_helper'
describe Address do
  # *****住所入力画面*****
  describe '#address_info_keep' do
    # 姓
    it  'is invalid without a last_name' do
      user = build(:address, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    # 名
    it  'is invalid without a first_name' do
      user = build(:address, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    # 姓（カナ）
    it  'is invalid without a last_name_kana' do
      user = build(:address, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end
    # 名（カナ）
    it  'is invalid without a first_name_kana' do
      user = build(:address, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    # 郵便番号
    it  'is invalid without a postal_code' do
      user = build(:address, postal_code: nil)
      user.valid?
      expect(user.errors[:postal_code]).to include("can't be blank")
    end
    # 都道府県
    it  'is invalid without a prefecture' do
      user = build(:address, prefecture: nil)
      user.valid?
      expect(user.errors[:prefecture]).to include("can't be blank")
    end
    # 市町村
    it  'is invalid without a municipalities' do
      user = build(:address, municipalities: nil)
      user.valid?
      expect(user.errors[:municipalities]).to include("can't be blank")
    end
    # 番地
    it  'is invalid without a address_number' do
      user = build(:address, address_number: nil)
      user.valid?
      expect(user.errors[:address_number]).to include("can't be blank")
    end
  end
end