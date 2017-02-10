require 'rails_helper'

RSpec.describe "When user visits category show" do
  scenario "they see details for that category" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: 'Finance')
    category.jobs.create(title: "Developer", city: "Denver", level_of_interest: 90, company: company)

    visit(category_path(category))

    expect page.has_content?("Developer")
    expect page.has_link?("Developer")
    expect page.has_content?("Finance")
  end
end
