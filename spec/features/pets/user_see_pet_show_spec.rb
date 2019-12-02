require 'rails_helper'

RSpec.describe 'pet show page', type: :feature do
  it 'can see pet info' do
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

      pet_2 = Pet.create!(
        shelter_id: shelter_1.id,
        image: 'pet_2.jpg',
        name: 'Doodoo',
        description: 'Golden Mutt',
        approx_age: 3,
        sex: 'male',
        adoptable?: false 

        )

    visit "/pets/#{pet_1.id}"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_css "img[src *= 'pet_1.jpg']"
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.approx_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content('Available for Adoption')

    visit "/pets/#{pet_2.id}"

    expect(page).to have_content(pet_2.name)
    expect(page).to have_css "img[src *= 'pet_2.jpg']"
    expect(page).to have_content(pet_2.description)
    expect(page).to have_content(pet_2.approx_age)
    expect(page).to have_content(pet_2.sex)
    expect(page).to have_content('Not available for adoption')
  end

end
