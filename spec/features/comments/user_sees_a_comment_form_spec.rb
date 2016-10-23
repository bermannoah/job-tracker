require 'rails_helper'

describe "User sees a comment form" do
  scenario "a user sees a comment form for a specific company" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", level_of_interest: 70)

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    find_field("comment_content")
  end
end
