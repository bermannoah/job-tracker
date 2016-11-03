require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create(name: "ESPN", city: "NYC")
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
  end
  
  scenario "a user can add a category to a new job" do
    company = Company.create(name: "ESPN", city: "NYC")
    category = Category.create(title: "Development")
    category = Category.create(title: "Another Test")
    category = Category.create(title: "Haberdashery")
    category = Category.create(title: "It's going to be so cold outside")

    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    find(:xpath, '//option[contains(text(), "Haberdashery")]').select_option
    
    click_button "Create"

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Haberdashery")
    expect(page).to have_content("80")

  end
  
  scenario "valid params" do
    company = Company.create(name: "ESPN", city: "NYC")
    category = Category.create(title: "Development")
    job = Job.create(title: "Sleep", level_of_interest: 100, description: "Zzzz")
    contact = Contact.new(name: "Sandman", email: "zzz@mythology.com")
    
    visit new_company_job_path(company)

    fill_in "job[title]", with: job.title
    fill_in "job[description]", with: job.description
    fill_in "job[level_of_interest]", with: job.level_of_interest
    find(:xpath, '//option[contains(text(), "Development")]').select_option
    
    click_button "Create"

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Development")
    expect(page).to have_content("100")
  end
  
  scenario "invalid params" do
    company = Company.create(name: "ESPN", city: "NYC")
    category = Category.create(title: "Development")
    job = Job.create(title: "Sleep")
    contact = Contact.new(name: "Sandman", email: "zzz@mythology.com")
    
    visit new_company_job_path(company)

    fill_in "job[title]", with: job.title
    fill_in "job[description]", with: job.description
    fill_in "job[level_of_interest]", with: job.level_of_interest
    find(:xpath, '//option[contains(text(), "Development")]').select_option
    
    click_button "Create"

    expect(page).to have_content("Please fill out all relevant information.")
  end
end
