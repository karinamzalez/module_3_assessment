require 'rails_helper'

RSpec.feature "guest user displays items" do
  scenario "user displays items" do
    visit '/'
    expect(page.status_code).to  eq(200)

    within('h1') do
      expect(page).to have_content('Items'), "page should have an Items heading"
    end
  end
end
