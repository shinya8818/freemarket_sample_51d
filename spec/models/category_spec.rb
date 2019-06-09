require 'rails_helper'

describe Category do
  describe '#create' do

    it "is invalid without a name" do
      category = build(:category, name: "")
      category.valid?
      expect(category.errors[:name]).to include("can't be blank")
    end
  end
end
