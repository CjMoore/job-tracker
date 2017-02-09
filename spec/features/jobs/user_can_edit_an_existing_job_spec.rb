require 'rails_helper'

RSpec.describe "When user fills out job edit form" do
  context "with valid inputs" do
    scenario "... they are directed to job show and see updated info" do
      category = Category.create(title: "Finance")
      company = Company.create(name: "ESPN")
      company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category: category)

      visit(edit_company_job_path(company, company.jobs.first))

      fill_in 'job[title]', :with => "Janitor"
      fill_in 'job[level_of_interest]', :with => 20
      fill_in 'job[description]', :with => "Pickin' up trash"
      fill_in 'job[city]', :with => "Baltimore"

      click_on "Update Job"

      expect page.has_current_path?(company_job_path(company, company.jobs.first))
      expect page.has_content?("Janitor")
      expect page.has_content?(20)
      expect page.has_content?("Pickin' up trash")
      expect page.has_content?("Baltimore")
    end
  end

  context "with invalid entries" do
    scenario "they see the edit form again" do
      category = Category.create(title: "Finance")
      company = Company.create(name: "ESPN")
      company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category: category)

      visit(edit_company_job_path(company, company.jobs.first))

      fill_in 'job[title]', :with => "Janitor"
      fill_in 'job[level_of_interest]', :with => 20
      fill_in 'job[description]', :with => "Pickin' up trash"
      fill_in 'job[city]', :with => nil

      expect page.has_current_path?(edit_company_job_path(company, company.jobs.first))
    end
  end
end
