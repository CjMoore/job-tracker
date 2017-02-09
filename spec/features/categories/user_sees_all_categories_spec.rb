require 'rails_helper'

RSpec.describe "When user is at category index" do
  scenario "they are able to see all categories" do
    category = Category.create(title: "Finance")
    category2 = Category.create(title: "Web Development")

    visit(categories_path)

    expect page.has_content?("Finance")
    expect page.has_content?("Web Development")
  end
end
