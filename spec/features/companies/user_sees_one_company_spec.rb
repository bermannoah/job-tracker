require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create(name: "ESPN", city: "LA")
    company.jobs.create(title: "Developer", level_of_interest: 90)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end
  
  scenario "a user sees all contacts for a company" do
    company = Company.create(name: "Blue Ant", city: "London")
    company.contacts.create(name: "Cayce Pollard", position: "Consultant", email: "caycep@blueant.com" )
    company.contacts.create(name: "Hubertus Bigend", position: "CEO", email: "hb@blueant.com" )
    company.contacts.create(name: "Dorothy", position: "Various", email: "d@blueant.com" )

    visit company_path(company)
    
    expect(page).to have_content("Cayce Pollard")
    expect(page).to have_content("CEO")
    expect(page).to have_content("d@blueant.com")
  end

end
