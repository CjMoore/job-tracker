require 'rails_helper'

RSpec.describe "When user visits category show" do
  scenario "they see details for that category" do
    category = Category.create(title: 'Finance')

    visit(category_path(category))

    expect page.has_content?("Finance")
  end
end
