require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    context "valid attributes" do
      it "is valid with a title" do
        category = Category.create(title: "Finance")
        expect(category).to be_valid
      end
    end
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.new()
        expect(category).to be_invalid
      end
      it "is invalid with a non-unique title" do
        category = Category.create(title: "Finance")

        category2 = Category.new(title: "Finance")
        expect(category2).to be_invalid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      category = Category.new(title: "Finance")
      expect(category).to respond_to(:jobs)
    end
  end
end
