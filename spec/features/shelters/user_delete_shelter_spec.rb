require 'rails_helper'

RSpec.describe 'When user clicks delete button', type: :feature do
  it 'can delete the shelter' do
    shelter_1 = Shelter.create(
      name: 'Shelter of Dog',
      address: '123 main street',
      city: 'Denver',
      state: 'CO',
      zip: '80234'
    )

    shelter_2 = Shelter.create(
      name: 'Shelter of Cat',
      address: '125 main street',
      city: 'Denver',
      state: 'CO',
      zip: '80334'
    )

  visit "/shelters/#{shelter_2.id}"
  click_button 'Delete'

  expect(current_path).to eq('/shelters/')
  expect(page).to have_no_content(shelter_2.name)
 end
end
