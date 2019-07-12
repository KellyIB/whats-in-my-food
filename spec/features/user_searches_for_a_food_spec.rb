require "rails_helper"

feature "User can search for a food" do
  scenario "with a valid food" do
    visit "/"
    fill_in :q, with: "sweet potatoes"
    click_on "Search"
    expect(current_path).to eq("/foods")
    expect(page).to have_content("531 Search Results for 'sweet potatoes'")

    # sorted by relevance
    expect(page).to have_css(".search_results-food", count: 10)
    within(first(".search_results-food")) do
      expect(page).to have_css(".food-ndb")
      expect(page).to have_css(".food-name")
      expect(page).to have_css(".food-group")
      expect(page).to have_css(".food-data_source")
      expect(page).to have_css(".food-manufacturer")
    end
  end
end

