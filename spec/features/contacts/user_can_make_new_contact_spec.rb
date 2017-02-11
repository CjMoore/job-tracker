require 'rails_helper'

RSpec.describe "When a user is on a company page" do
  scenario "they are able to fill out a form and create a new contact" do
    category = Category.create(title: "Finance")
    company = Company.create(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category: category)

    visit company_jobs_path(company, company.jobs)

    fill_in 'contact[name]',  :with => "Dude McDudeface"
    fill_in 'contact[position]', :with => "Janitor"
    fill_in 'contact[email]', :with => "Dude@company.com"

    click_on("Submit")

    expect(page).to have_content("Dude McDudeface")
    expect(page).to have_content("Janitor")
    expect(page).to have_content("Dude@company.com")
  end
end
