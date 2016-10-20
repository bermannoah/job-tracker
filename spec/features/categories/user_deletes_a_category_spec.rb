require 'rails_helper'

describe "User deletes a category" do
  scenario "a user can delete a category" do
    category = Category.create(title: "Entertainment")
    category = Category.create(title: "Drama")
    
    visit categories_path
    first('li').click_link('Delete Category')
      
    expect(page).to have_content("Drama")
    expect(page).to_not have_content("Entertainment")
  end
  
end