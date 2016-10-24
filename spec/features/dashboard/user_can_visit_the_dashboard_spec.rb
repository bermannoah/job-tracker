require 'rails_helper'

describe "User sees tbe dashboard" do
  scenario "a user sees the dashboard page" do
    company = Company.create(name: "ESPN", city: "LA")
    company.jobs.create(title: "Developer", level_of_interest: 70)
    company.jobs.create(title: "QA Analyst", level_of_interest: 70)

    visit dashboard_index_path

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Dashboard")
  end
  
  scenario "a user sees jobs by level of interest" do
    company_1 = Company.create(name: "ESPN", city: "LA")
    company_2 = Company.create(name: "Sony", city: "LA")
    company_3 = Company.create(name: "Trader Joes", city: "LA")
    company_4 = Company.create(name: "Starbucks", city: "LA")
    
    company_1.jobs.create(title: "Developer", level_of_interest: 100)
    company_2.jobs.create(title: "QA Analyst", level_of_interest: 2)
    company_1.jobs.create(title: "Developer", level_of_interest: 100)
    company_3.jobs.create(title: "QA Analyst", level_of_interest: 90)
    company_2.jobs.create(title: "Developer", level_of_interest: 2)
    company_1.jobs.create(title: "QA Analyst", level_of_interest: 70)
    company_4.jobs.create(title: "Barista", level_of_interest: 1)
    
    visit dashboard_index_path

    expect(page).to have_content("100")
    expect(page).to have_content("2")
    expect(page).to have_content("90")
  end
  
  scenario "a user sees the top three companies" do
    company_1 = Company.create(name: "ESPN", city: "LA")
    company_2 = Company.create(name: "Sony", city: "LA")
    company_3 = Company.create(name: "Trader Joes", city: "LA")
    company_4 = Company.create(name: "Starbucks", city: "LA")
    
    company_1.jobs.create(title: "Developer", level_of_interest: 100)
    company_2.jobs.create(title: "QA Analyst", level_of_interest: 2)
    company_1.jobs.create(title: "Developer", level_of_interest: 100)
    company_3.jobs.create(title: "QA Analyst", level_of_interest: 90)
    company_2.jobs.create(title: "Developer", level_of_interest: 2)
    company_1.jobs.create(title: "QA Analyst", level_of_interest: 70)
    company_4.jobs.create(title: "Barista", level_of_interest: 1)
    
    visit dashboard_index_path

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Sony")
    expect(page).to have_content("2.0")
    expect(page).to_not have_content("Starbucks")
  end
end
