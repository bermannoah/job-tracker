require 'rails_helper'

describe "User sees jobs sorted by interest" do
  scenario "a user sees all jobs sorted by interest in ascending order" do
    company = Company.create(name: "ESPN", city: "LA")
    company.jobs.create(title: "Developer", level_of_interest: 1)
    company.jobs.create(title: "QA Analyst", level_of_interest: 2)
    company.jobs.create(title: "Developer", level_of_interest: 3)
    company.jobs.create(title: "QA Analyst", level_of_interest: 4)


    visit "/jobs?sort=interest"

    expect(page).to have_content("1")
    expect(page).to have_content("QA Analyst")
    expect(page).to_not have_content("Disney")
    expect(page).to have_content(/4.*3.*2.*1/)
  end
end