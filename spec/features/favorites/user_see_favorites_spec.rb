require 'rails_helper'

RSpec.describe 'When I visit the favorites index page', type: :feature do
  before :each do
    @shelter_1 = create :random_shelter
    @pets = create_list(:random_pet, 10, shelter: @shelter_1)
  end

  it 'can favorite a pet' do
    visit "/pets/#{@pets[1].id}"

    click_on 'Favorite'

    expect(page).to have_content('Pet added to favorites.')
    expect(page).to have_content('Favorites(1)')

    visit "/pets/#{@pets[2].id}"

    click_on 'Favorite'

    expect(page).to have_content('Pet added to favorites.')
    expect(page).to have_content('Favorites(2)')

    visit "/pets/#{@pets[3].id}"

    click_on 'Favorite'

    expect(page).to have_content('Pet added to favorites.')
    expect(page).to have_content('Favorites(3)')

    visit "/favorites"

    expect(page).to have_content(@pets[1].name)
    expect(page).to have_content(@pets[2].name)
    expect(page).to have_content(@pets[3].name)
    expect(page).to have_css("img[src *= #{@pets[1].image}]")
    expect(page).to have_css("img[src *= #{@pets[2].image}]")
    expect(page).to have_css("img[src *= #{@pets[3].image}]")
  end

end
