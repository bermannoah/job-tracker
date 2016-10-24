require 'rails_helper'

describe "User creates a new tag" do
  scenario "a user can create a new tag with a name" do
    visit new_tag_path

    fill_in "tag[name]", with: "a new tag"
    click_button "Create"

    expect(current_path).to eq("/tags")
    expect(page).to have_content("a new tag")
    expect(Tag.count).to eq(1)
  end
end
