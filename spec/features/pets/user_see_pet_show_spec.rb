require 'rails_helper'

RSpec.describe 'pet show page', type: :feature do

  before :each do
    @shelter_1 = create :random_shelter
    @pets = create_list(:random_pet, 2, shelter: @shelter_1)
  end

  it 'can see pet info' do

    visit "/pets/#{@pets[0].id}"

    expect(page).to have_content(@pets[0].name)
    expect(page).to have_content(@pets[0].description)
    expect(page).to have_content(@pets[0].approx_age)
    expect(page).to have_content(@pets[0].sex)
    expect(page).to have_content('adoptable')

    visit "/pets/#{@pets[1].id}"

    expect(page).to have_content(@pets[1].name)
    expect(page).to have_content(@pets[1].description)
    expect(page).to have_content(@pets[1].approx_age)
    expect(page).to have_content(@pets[1].sex)
    expect(page).to have_content('adoptable')
  end

  it 'can favorite pet' do
    visit "/pets/#{@pets[0].id}"
    click_button 'Favorite'

    page.has_button?('Remove from Favorites')
    expect(page).to have_content('Favorites 1')

  end

end
