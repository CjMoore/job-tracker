require 'rails_helper'

RSpec.describe "user fills out comment form on job page" do
  scenario "and the comment appears on that job page in the correct order" do
    category = Category.create(title: "Finance")
    company = Company.create(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category: category)

    visit(company_job_path(company, company.jobs.first))

    fill_in 'comment[content]', :with => "Cool job"
    fill_in 'comment[author]', :with => "Charlotte"

    click_on("Submit")

    expect(page).to have_content("Cool job")
    expect(page).to have_content("Charlotte")

    fill_in 'comment[content]', :with => "Cool story bro"
    fill_in 'comment[author]', :with => "Boris"

    expect page.all('p')[1].has_content?("Boris")
    expect page.all('p')[2].has_content?("Cool story bro")
  end
end
