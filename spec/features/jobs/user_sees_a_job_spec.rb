require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", level_of_interest: 70)

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end
  
  scenario "a user sees all comments for job" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", level_of_interest: 70)
    
    job.comments.create(content: "Test 0")
    job.comments.create(content: "Test 1")
    job.comments.create(content: "Test 2")
    visit company_job_path(company, job)


    expect(page).to have_content("Test 0")
    expect(page).to have_content("Test 1")
    expect(page).to have_content("Test 2")
  end
  
  scenario "a user sees all comments in order of newest to oldest" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", level_of_interest: 70)
    
    job.comments.create(content: "Test 0")
    job.comments.create(content: "Test 1")
    job.comments.create(content: "Test 2")
    job.comments.create(content: "Test 3")
    visit company_job_path(company, job)


    expect(page).to have_content(/Test 3.*Test 2.*Test 1.*Test 0/)
  end
end
