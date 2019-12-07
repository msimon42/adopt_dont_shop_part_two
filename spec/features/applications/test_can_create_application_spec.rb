require 'rails_helper'

RSpec.describe 'When a user clicks the submit button', type: :feature do
  before :each do
    @shelter_1 = create :random_shelter
    @pets = create_list(:random_pet, 10, shelter: @shelter_1)

    visit "/pets/#{@pets[0].id}"
    click_on 'Favorite'

    visit "/pets/#{@pets[1].id}"
    click_on 'Favorite'
  end

  it 'can create an application and remove favorited pets you applied for' do
    visit '/application/new'

    fill_in 'Name', with: 'Test'
    fill_in 'Address', with: 'Test'
    fill_in 'City', with: 'Test'
    fill_in 'State', with: 'Test'
    fill_in 'Zip', with: 'Test'
    fill_in 'Phone number', with: 'Test'
    fill_in 'Description', with: 'Test'
    page.check("pet[#{@pets[1].id}]")

    click_button 'Submit'

    expect(current_path).to eq('/favorites')
    expect(page).to have_content('Favorites(1)')
    
  end
end
