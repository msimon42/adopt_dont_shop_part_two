require 'rails_helper'

RSpec.describe 'When I visit the favorites index page', type: :feature do
  before :each do
    @shelter_1 = create :random_shelter
    @pets = create_list(:random_pet, 10, shelter: @shelter_1)
  end

  it 'is empty' do
    visit '/favorites'

    expect(page).to have_content('You have no favorites :(')
  end


  it 'can favorite a pet' do
    visit "/pets/#{@pets[1].id}"
    expect(page).to have_button('Favorite')

    click_on 'Favorite'

    expect(page).to have_content('Pet added to favorites.')
    expect(page).to have_content('Favorites(1)')
    expect(page).to have_button('Remove Favorite')


    visit "/pets/#{@pets[2].id}"
    expect(page).to have_button('Favorite')

    click_on 'Favorite'

    expect(page).to have_content('Pet added to favorites.')
    expect(page).to have_content('Favorites(2)')
    expect(page).to have_button('Remove Favorite')


    visit "/pets/#{@pets[3].id}"
    expect(page).to have_button('Favorite')

    click_on 'Favorite'

    expect(page).to have_content('Pet added to favorites.')
    expect(page).to have_content('Favorites(3)')
    expect(page).to have_button('Remove Favorite')


    click_on 'Remove Favorite'

    expect(page).to have_button('Favorite')
    expect(page).to have_content('Favorites(2)')

    visit "/favorites"

    expect(page).to have_content(@pets[1].name)
    expect(page).to have_content(@pets[2].name)

    within("#favorite-pet-#{@pets[1].id}") do
      click_on 'Remove Favorite'
    end

    expect(page).to have_no_content(@pets[1].name)
    expect(page).to have_content(@pets[2].name)

  end
end
