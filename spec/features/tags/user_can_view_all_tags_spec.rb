require 'rails_helper'

describe "User can view all tags" do
  scenario "a user can view all tags" do
    tag_1 = Tag.create(name: "Test 1")
    tag_2 = Tag.create(name: "Test 2")
    tag_3 = Tag.create(name: "Test 3")
    tag_4 = Tag.create(name: "Test 4")

    visit tags_path
    
    expect(current_path).to eq("/tags")
    expect(page).to have_content("Test 1")
    expect(page).to have_content("Test 2")
    expect(page).to have_content("Test 3")
    expect(Tag.count).to eq(4)
  end
end
