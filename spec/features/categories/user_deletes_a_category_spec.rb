require 'rails_helper'

describe "User deletes a category" do
  scenario "a user can delete a category" do
    category = Category.create(title: "Entertainment")
    
    visit categories_path
    within(".list-group-item") do
      click_on("Delete Category")
    end
      
    expect(page).to_not have_content("Entertainment")
  end
  
end