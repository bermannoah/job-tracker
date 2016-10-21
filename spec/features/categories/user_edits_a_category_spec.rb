require 'rails_helper'

describe "User edits a category" do
  scenario "a user can edit a category" do
    category = Category.create(title: "Entertainment")
    
    visit categories_path

    click_link "Edit Category"
    fill_in "category[title]", with: "Drama"
    click_button "Update Category"
    
    expect(page).to have_content("Drama")
  end
  
end
