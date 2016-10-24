require 'rails_helper'

describe "User can delete a tag" do
  scenario "a user deletes a tag" do
    tag_1 = Tag.create(name: "Test 1")
    tag_2 = Tag.create(name: "Test 2")
    tag_3 = Tag.create(name: "Test 3")
    tag_4 = Tag.create(name: "Test 4")

    visit tags_path
    within(".tag_#{tag_1.id}") do
      click_link "Delete"
    end
    
    expect(current_path).to eq("/tags")
    expect(page).to_not have_content("Test 1")
    expect(page).to have_content("Test 2")
    expect(page).to have_content("Test 3")
    expect(Tag.count).to eq(3)
  end
end