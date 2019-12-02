require 'rails_helper'

RSpec.describe 'shelters index page', type: :feature do
  it 'can see all shelters' do
    shelter_1 = Shelter.create(
      name: 'Shelter of Dog',
      address: '123 main street',
      city: 'Denver',
      state: 'CO',
      zip: '80234'
    )

    shelter_2 = Shelter.create(
      name: 'Dog city',
      address: '2246 Wallaby Way',
      city: 'Sydney',
      state: 'NSW',
      zip: 'NW1 345'
    )

    visit '/shelters'

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
