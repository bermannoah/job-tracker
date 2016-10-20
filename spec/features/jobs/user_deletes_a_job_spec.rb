require 'rails_helper'

describe "User deletes a job" do
  scenario  "a user can delete a job" do
    company = Company.create(name: "The Guardian", city: "London")
    visit new_company_job_path(company)
    
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "The best!"
    fill_in "job[level_of_interest]", with: 80
    
    click_button "Create"
        
    visit new_company_job_path(company)
    
    fill_in "job[title]", with: "Journalist"
    fill_in "job[description]", with: "Also the best!"
    fill_in "job[level_of_interest]", with: 80
    click_button "Create"
    click_link "The Guardian"
    expect(page).to have_content("Developer")
    expect(page).to have_content("Journalist")

    click_link "Journalist"
    click_link "Delete"
    
    expect(page).to_not have_content("Journalist")
    expect(page).to have_content("Developer")
  end
end