require 'rails_helper'

describe Category do
  describe '#create' do

    it "is invalid without a image" do
      category = build(:category, name:"")
      category.valid?
      expect(category.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a image" do
      category = build(:image, item_id:"")
      category.valid?
      expect(category.errors[:item_id]).to include("can't be blank")
    end
  end
end
