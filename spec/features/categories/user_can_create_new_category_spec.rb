require 'rails_helper'

RSpec.describe "User creates fills out a new category form" do
  scenario "and is able to create a new category"  do

    visit(new_category_path)

    fill_in 'category[title]', :with => "Finance"
    click_button "Create Category"

    expect page.has_current_path?(category_path(Category.first))
    expect page.has_content?("Finance")
  end
end
