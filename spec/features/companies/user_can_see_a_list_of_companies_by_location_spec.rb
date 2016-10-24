require 'rails_helper'

describe "User sees all companies" do
  scenario "a user sees all the companies by location" do
    company = Company.create(name: "ESPN", city: "LA")
    company_two = Company.create(name: "Disney", city: "LA")
    company_three = Company.create(name: "Channel4", city: "LA")
    company_four = Company.create(name: "Eight Light", city: "Boston")


    visit "/companies?sort=location"

    expect(page).to have_content("ESPN")
    expect(page).to have_content("LA")
    expect(page).to have_content("Boston")
  end

end