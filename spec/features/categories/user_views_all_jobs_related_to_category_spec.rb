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
  
  scenario "user sees all jobs related to category" do
    company = Company.create(name: "ESPN", city: "NYC")
    category_1 = Category.create(title: "Development")
    category_2 = Category.create(title: "Another Test")
    category_3 = Category.create(title: "Haberdashery")
    category_4 = Category.create(title: "It's going to be so cold outside")

    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    find(:xpath, '//option[contains(text(), "Haberdashery")]').select_option
    
    click_button "Create"
    
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Some other thing"
    fill_in "job[description]", with: "It's really great!"
    fill_in "job[level_of_interest]", with: 90
    find(:xpath, '//option[contains(text(), "Haberdashery")]').select_option
    
    click_button "Create"
    
    visit category_path(category_3)
    
    expect(page).to have_content("Developer")
    expect(page).to have_content("Some other thing")
  end
  
end
