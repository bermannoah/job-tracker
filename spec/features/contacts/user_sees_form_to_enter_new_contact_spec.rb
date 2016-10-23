require 'rails_helper'

describe "User sees a contact form" do
  scenario "a user sees a contact form for a specific company" do
    company = Company.create(name: "ESPN", city: "LA")

    visit company_path(company)

    expect(page).to have_content("ESPN")
    find_field("contact_name")
    find_field("contact_position")
    find_field("contact_email")
  end
end
