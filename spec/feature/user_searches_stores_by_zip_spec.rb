require 'rails_helper'

RSpec.feature "guest user displays items" do
  scenario "user displays items" do
  visit '/'

  within(:search_box) do
    fill_in :zip, with: "80202"
  end

  click_on "search"

  expect(current_path).to include '/search'

  within('#store_list') do
    expect(page).to have_content "17 Total Stores"
    expect(stores.count).to eq 15
    expect(stores.first.long_name).to eq "Best Buy Mobile - Cherry Creek Shopping Center"
    expect(stores.first.city).to eq "Denver"
    expect(stores.first.distance).to eq 3.25
    expect(stores.first.phone_number).to eq "303-270-9189"
    expect(stores.first.store_type).to eq "Mobile"
  end
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results
  end
end
