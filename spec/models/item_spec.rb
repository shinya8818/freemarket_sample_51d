require 'rails_helper'

describe Item do
  describe '#create' do

    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a category_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without a status" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    it "is invalid without a condition" do
      item = build(:item, condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "is invalid without a shipping_fee" do
      item = build(:item, shipping_fee: "")
      item.valid?
      expect(item.errors[:shipping_fee]).to include("can't be blank")
    end

    it "is invalid without a delivery" do
      item = build(:item, delivery: "")
      item.valid?
      expect(item.errors[:delivery]).to include("can't be blank")
    end

    it "is invalid without a prefecture" do
      item = build(:item, prefecture: "")
      item.valid?
      expect(item.errors[:prefecture]).to include("can't be blank")
    end

    it "is invalid without a days" do
      item = build(:item, days: "")
      item.valid?
      expect(item.errors[:days]).to include("can't be blank")
    end

    it "is invalid without a fee" do
      item = build(:item, fee: "")
      item.valid?
      expect(item.errors[:fee]).to include("can't be blank")
    end

    it "is invalid without a user_id" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end

  end
end
