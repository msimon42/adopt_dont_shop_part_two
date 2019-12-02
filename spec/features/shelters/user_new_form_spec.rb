require 'rails_helper'

RSpec.describe 'new shelter form' do
  it 'can see shelter form and create shelter' do
    visit 'shelters/new'

    expect(page).to have_field('Name')
    expect(page).to have_field('Address')
    expect(page).to have_field('City')
    expect(page).to have_field('State')
    expect(page).to have_field('Zip')

    fill_in 'Name', with: 'New Shelter'
    fill_in 'Address', with: '123 Main'
    fill_in 'City', with: 'Denver'
    fill_in 'State', with: 'CO'
    fill_in 'Zip', with: '80211'

    click_on 'Submit'
    new_shelter = Shelter.last

    expect(current_path).to eq('/shelters')
    expect(page).to have_content(new_shelter.name)
  end
end
