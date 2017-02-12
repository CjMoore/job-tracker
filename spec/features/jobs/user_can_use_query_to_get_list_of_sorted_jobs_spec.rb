require 'rails_helper'

RSpec.describe "When user visits analysis page" do
  context "with sort=location query" do
    it "they are able to see all jobs sorted by location" do
      category = Category.create(title: "Finance")
      company = Company.create!(name: "ESPN")
      company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
      company.jobs.create!(title: "QA Analyst", level_of_interest: 50, city: "New York City", category: category)
      company.jobs.create!(title: "Teacher", level_of_interest: 90, city: "Atlanta", category: category)

      visit('/jobs?sort=location')

      group_titles = page.all('h4')

      expect(group_titles[0]).to have_content("Teacher")
      expect(group_titles[1]).to have_content("Developer")
      expect(group_titles[2]).to have_content("QA Analyst")
    end
  end

  context "with sort=interest" do
    it "they are able to see all jobs sorted by level_of_interest" do
      category = Category.create(title: "Finance")
      company = Company.create!(name: "ESPN")
      company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
      company.jobs.create!(title: "QA Analyst", level_of_interest: 50, city: "New York City", category: category)
      company.jobs.create!(title: "Teacher", level_of_interest: 90, city: "Atlanta", category: category)

      visit('jobs?sort=interest')

      group_titles = page.all('h4')

      expect(group_titles[0]).to have_content("QA Analyst")
      expect(group_titles[1]).to have_content("Developer")
      expect(group_titles[2]).to have_content("Teacher")
    end
  end
end
