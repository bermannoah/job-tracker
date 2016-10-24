require 'rails_helper'

describe "User sees all companies" do
  scenario "a user sees only the jobs at the specified location" do
    company = Company.create(name: "ESPN", city: "LA")
    company_two = Company.create(name: "Disney", city: "LA")
    company_three = Company.create(name: "Channel4", city: "LA")
    company_four = Company.create(name: "Leverage", city: "Boston")


    visit "/companies?location=Boston"

    expect(page).to have_content("Boston")
    expect(page).to have_content("Leverage")
    expect(page).to_not have_content("Disney")
    
    visit "/companies?location=LA"

    expect(page).to have_content("LA")
    expect(page).to have_content("Disney")
    expect(page).to_not have_content("Leverage")
  end
end