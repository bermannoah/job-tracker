require 'rails_helper'

describe "User views all categories" do
  scenario "a user can view all categories" do
    category = Category.create(title: "Entertainment")
    category_two = Category.create(title: "Development")

    visit categories_path

    expect(page).to have_content("Entertainment")
    expect(page).to have_content("Development")
  end  
end
