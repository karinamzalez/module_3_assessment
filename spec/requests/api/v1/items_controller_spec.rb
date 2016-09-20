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

  it "gets single instance of item" do
    get '/api/v1/items/1'
    assert_response :success

    parsed_item = JSON.parse(response.body)

    expect(parsed_item['name']).to eq 'banana'
    expect(parsed_item.count).to eq 4
    expect(parsed_item).not_to include("created_at")
  end
end
