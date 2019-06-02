require 'rails_helper'

describe Image do
  describe '#create' do

    it "is invalid without a image" do
      image = build(:image, image:"")
      image.valid?
      expect(image.errors[:image]).to include("can't be blank")
    end

    it "is invalid without a image" do
      image = build(:image, item_id:"")
      image.valid?
      expect(image.errors[:item_id]).to include("can't be blank")
    end
  end
end
