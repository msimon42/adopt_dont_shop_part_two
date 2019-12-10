require 'rails_helper'

RSpec.describe 'edit review form' do
  before :each do
    Shelter.delete_all
    Review.delete_all
    @shelter_1 = create :random_shelter
    @reviews = create_list(:random_review_test, 2, shelter: @shelter_1)
  end

  it 'can be viewed by user' do
    visit "/shelters/#{@shelter_1.id}/edit-review/#{@reviews[0].id}"

    expect(page).to have_content('Edit Review')

    expect(page).to have_field('Image')
    expect(page).to have_field('Content')
    expect(page).to have_field('Rating')

    fill_in 'Title', with: 'A Terrible Experience with Terrible People'
    fill_in 'Image', with: 'pebbles.png'
    fill_in 'Content', with: 'When I entered the shelter, a woman by the name of Maud told me my nose was too big. Very bad form.'
    select 1, :from => :rating

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    expect(page).to have_content('A Terrible Experience with Terrible People')
    expect(page).to have_content('When I entered the shelter, a woman by the name of Maud told me my nose was too big. Very bad form.')
    expect(page).to have_content(@reviews[1].title)
  end
end
