require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    visit new_category_path
    fill_in "category[title]", with: "Developer"

    click_button "Create Category"

    expect(page).to have_content("Developer")
  end
end
