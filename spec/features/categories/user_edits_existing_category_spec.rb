require 'rails_helper'

RSpec.describe "When a user fills out a category edit form" do
  scenario "they are able to update a category" do
    category = Category.create(title: "Finance")

    visit(edit_category_path(category))

    fill_in 'category[title]', :with => "Stuff"
    click_button "Update Category"

    expect page.has_content?("Stuff")
  end
end
