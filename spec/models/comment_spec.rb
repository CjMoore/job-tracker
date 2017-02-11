require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    context "with invalid attributes" do
      it "is invalid without an author" do
        comment = Comment.new(content: "Cool story bro")
        expect(comment).to be_invalid
      end
      it "is invalid without content" do
        comment = Comment.new(author: "Boris")
        expect(comment).to be_invalid
      end
    end

    context "with valid attributes" do
      it "is valid with both author and content" do
        comment = Comment.new(author: "Boris", content: "Cool story bro")
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a job" do
      comment = Comment.new(author: "Boris", content: "Cool story bro")
      expect(comment).to respond_to(:job)
    end
  end
end
