RSpec.describe 'new pet form', type: :feature do
  it 'can render fields' do
    shelter_1 = Shelter.create(
      name: 'Shelter of Dog',
      address: '123 main street',
      city: 'Denver',
      state: 'CO',
      zip: '80234'
    )

    visit "/shelters/#{shelter_1.id}/pets/new"

    expect(page).to have_field('Name')
    expect(page).to have_field('Image file')
    expect(page).to have_field('Description')
    expect(page).to have_field('Approx age')
    expect(page).to have_content('Male')
    expect(page).to have_content('Female')

    fill_in 'Name', with: 'Pebbles'
    fill_in 'Image file', with: 'pebbles.png'
    fill_in 'Description', with: 'Half breed lab'
    fill_in 'Approx age', with: '3'
    choose  'gender', with: 'Female'

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content('Pebbles')
  end
end
