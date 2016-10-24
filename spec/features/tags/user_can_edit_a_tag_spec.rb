require 'rails_helper'

describe "User can edit a tag" do
  scenario "a user edits a tag" do
    tag_1 = Tag.create(name: "Test 1")

    visit tags_path
    within(".tag_#{tag_1.id}") do
      click_link "Edit"
    end
    
    fill_in "tag[name]", with: "coffee"
    click_button "Update"
    expect(page).to have_content("coffee")
    expect(page).to_not have_content("Test 1")
  end
end