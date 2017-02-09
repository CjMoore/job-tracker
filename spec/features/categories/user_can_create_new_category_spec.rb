require 'rails_helper'

RSpec.describe "User creates fills out a new category form" do
  context "with valid attributes" do
    scenario "and is able to create a new category"  do

      visit(new_category_path)

      fill_in 'category[title]', :with => "Finance"
      click_button "Create Category"

      expect page.has_current_path?(category_path(Category.first))
      expect page.has_content?("Finance")
    end
  end

  context "with invalid attributes" do
    it "they see the new form" do
      visit(new_category_path)

      fill_in 'category[title]', :with => nil
      click_button "Create Category"

      expect page.has_current_path?(new_category_path)
    end
  end
end
