RSpec.describe 'When user clicks delete button on pet page', type: :feature do
  it 'will delete the pet' do
    shelter_1 = Shelter.create(
      name: 'Shelter of Dog',
      address: '123 main street',
      city: 'Denver',
      state: 'CO',
      zip: '80234'
    )
    pet_1 = Pet.create(
      shelter_id: shelter_1.id,
      image: 'pet_1.jpg',
      name: 'Fido',
      description: 'Golden Retriver',
      approx_age: 3,
      sex: 'male',
      adoptable?: true

      )
      pet_2 = Pet.create(
        shelter_id: shelter_1.id,
        image: 'pet_2.jpg',
        name: 'Frufru',
        description: 'Golden Maltese',
        approx_age: 2,
        sex: 'female',
        adoptable?: true

        )

    visit "/pets/#{pet_2.id}"
    click_button 'Delete'
    expect(current_path).to eq("/pets/")
    expect(page).to have_no_content('Frufru')
  end
end
