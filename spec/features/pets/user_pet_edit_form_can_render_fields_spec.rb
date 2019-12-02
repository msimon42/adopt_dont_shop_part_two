RSpec.describe 'edit pet form', type: :feature do
  it 'can render fields' do
    shelter_1 = Shelter.create(
      name: 'Shelter of Dog',
      address: '123 main street',
      city: 'Denver',
      state: 'CO',
      zip: '80234'
    )

    pet_1 = Pet.create!(
      shelter_id: shelter_1.id,
      image: 'pet_1.jpg',
      name: 'Fido',
      description: 'Golden Retriver',
      approx_age: 3,
      sex: 'male',
      adoptable?: true

      )

    visit "/pets/#{pet_1.id}/edit"

    expect(page).to have_field('Name')
    expect(page).to have_field('Image file')
    expect(page).to have_field('Description')
    expect(page).to have_field('Approx age')

    fill_in 'Description', with: 'Half breed golden retriever'
    fill_in 'Approx age', with: '4'

    click_button 'Submit'

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content('4')
    expect(page).to have_content('Half breed golden retriever')
  end
end
