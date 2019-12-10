require 'rails_helper'

RSpec.describe 'shelters show page', type: :feature do

  before :each do
    @shelter_1 = create :random_shelter
    @reviews = create_list(:random_review, 5,  shelter: @shelter_1)
  end


  it 'can see shelter' do

    visit "shelters/#{@shelter_1.id}"

    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content("Address: #{@shelter_1.address}")
    expect(page).to have_content("City: #{@shelter_1.city}")
    expect(page).to have_content("State: #{@shelter_1.state}")
    expect(page).to have_content("Zip: #{@shelter_1.zip}")

  end

  it 'can see reviews' do

    visit "/shelters/#{@shelter_1.id}"

    @reviews.each do |review|
      expect(page).to have_content(review.title)
      expect(page).to have_content(review.rating)
      expect(page).to have_content(review.content)
      #expect(page).to have_content(review.created_at)
    end

    it "can show number of pets, shelter rating and number of applications" do
      visit "/shelters"

      expect(page).to have_content("Pet count: #{@shelter_1.pet_count}")
      expect(page).to have_content("Applications count: #{@shelter_1.applications}")
      expect(page).to have_content("Average rating: #{@shelter_1.avg_rating}")
    end
  end
end
