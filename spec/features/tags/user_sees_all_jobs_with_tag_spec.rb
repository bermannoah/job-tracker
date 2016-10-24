require 'rails_helper'

describe "User can see all jobs with a tag" do
  scenario "a user clicks on a tag" do
    category = Category.create(title: "Development")
    category = Category.create(title: "Another Test")
    category = Category.create(title: "Haberdashery")
    company = Company.create(name: "ESPN", city: "NYC")
    
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[tag_list]", with: "hello"
    
    click_button "Create"

    visit new_company_job_path(company)

    fill_in "job[title]", with: "Editor"
    fill_in "job[description]", with: "So so fun!"
    fill_in "job[level_of_interest]", with: 82
    fill_in "job[tag_list]", with: "hello"

    click_button "Create"

    click_link "hello"
    
    expect(page).to have_content("Developer")
    expect(page).to have_content("Editor")
  end
end