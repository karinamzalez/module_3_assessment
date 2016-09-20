require 'rails_helper'

RSpec.feature "guest user displays items" do
  scenario "user displays items" do
    VCR.use_cassette "stores#stores" do

    visit '/'

    fill_in :zip, with: "80202"

    click_on "search"

    expect(current_path).to include '/search'

    within("#store_list") do
      expect(page).to have_content "17 Total Stores"
      # expect(("h5").count).to eq 15
      expect(page).to have_content "Best Buy Mobile - Cherry Creek Shopping Center"
      expect(page).to have_content "Denver"
      expect(page).to have_content 3.25
      expect(page).to have_content "303-270-9189"
      expect(page).to have_content "Mobile"
    end
  end
  end
end
