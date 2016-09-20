require 'rails_helper'

RSpec.describe "items controller" do
  fixtures :items

  it "gets all items" do
    get '/api/v1/items'
    assert_response :success

    parsed_items = JSON.parse(response.body)

    expect(parsed_items.count).to eq 3
    expect(parsed_items.first['name']).to eq "banana"
    expect(parsed_items.first).not_to include("created_at")
  end
end
