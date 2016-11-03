require 'rails_helper'

describe "user sees tags on job page" do
  scenario "user visits job page and sees tag" do
    tag = Tag.create(name: "great_job")
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", level_of_interest: 70, tags: [tag])

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content("great_job")
  end
  
  scenario "user visits job page and sees tag and number of jobs with tag" do
    tag = Tag.create(name: "great_job")
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", level_of_interest: 70, tags: [tag])
    job_2 = company.jobs.create(title: "Other Job", level_of_interest: 70, tags: [tag])

    visit company_job_path(company, job)

    expect(page).to have_content("great_job - 2")
  end
end