require 'rails_helper'

RSpec.describe "User clicks delelete on category index" do
  scenario "and can no longer see that category title" do
    Category.create(title: "Finance")

    visit(categories_path)

    click_on("Delete")

    expect page.has_no_content?("Finance")
  end
end
