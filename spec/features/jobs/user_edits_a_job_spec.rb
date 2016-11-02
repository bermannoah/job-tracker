require 'rails_helper'

describe "User edits a job" do
  scenario  "a user can edit a job" do
    company = Company.create(name: "The Guardian", city: "London")
    visit new_company_job_path(company)
    
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "The best!"
    fill_in "job[level_of_interest]", with: 80
    
    click_button "Create"
    expect(page).to have_content("The Guardian")
    click_link "Edit"

    fill_in "job[title]", with: "Journalist"
    fill_in "job[description]", with: "Another option!"
    fill_in "job[level_of_interest]", with: 80

    click_button "Update Job"
    
    expect(page).to have_content("Journalist")
    expect(page).to have_content("Another option!")
    expect(page).to have_content("80")
  end
end