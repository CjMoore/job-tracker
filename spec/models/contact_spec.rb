require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "validations" do
    context "with valid attributes" do
      it "is valid with name email and position" do
        contact = Contact.new(name: "Boris", position: "Token Kitty", email: "Cat@company.com")
        expect(contact).to be_valid
      end
    end

    context "with invalid attributes" do
      it "is invalid without a name" do
        contact = Contact.new(position: "Token Kitty", email: "Cat@company.com")
        expect(contact).to be_invalid
      end
      it "is invalid without a position" do
        contact = Contact.new(name: "Boris", email: "Cat@company.com")
        expect(contact).to be_invalid
      end
      it "is is invalid without an email" do
        contact = Contact.new(name: "Boris", position: "Token Kitty")
        expect(contact).to be_invalid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = Contact.new(name: "Boris", position: "Token Kitty", email: "Cat@company.com")
      expect(contact).to respond_to(:company)
    end
  end
end
