require 'rails_helper'

RSpec.describe "When the user deletes a job" do
  scenario "they are directed to company page and do not see the deleted job" do
    company = Company.create(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")

    visit(company_job_path(company, company.jobs.first))

    click_on ("Delete")

    expect page.has_current_path?(company_jobs_path(company))
    expect page.has_no_content?("Developer")
  end
end
