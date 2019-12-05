require 'rails_helper'
RSpec.describe 'When a user clicks the delete button', type: :feature do
  before :each do
    @shelter_1 = create :random_shelter
    @reviews = create_list(:random_review, 5, shelter: @shelter_1)
  end

  it 'deletes the review' do
    visit "/shelters/#{@shelter_1.id}"
    within("#review-#{@reviews[0].id}") do
      click_button 'Delete'
    end

    expect(page).to have_content(@reviews[1].title)
    expect(page).to_not have_content(@reviews[0].title)
  end
end
