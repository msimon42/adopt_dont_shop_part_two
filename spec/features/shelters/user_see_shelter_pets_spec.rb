require 'rails_helper'

RSpec.describe 'shelter pets index', type: :feature do
  it 'can see pets in shelter' do
    shelter_1 = Shelter.create(
      name: 'Shelter of Dog',
      address: '123 main street',
      city: 'Denver',
      state: 'CO',
      zip: '80234'
    )

    shelter_2 = Shelter.create(
      name: 'Shelter of Cat',
      address: '124 main street',
      city: 'Denver',
      state: 'CO',
      zip: '80244'
    )

    pet_1 = Pet.create(
      shelter_id: shelter_1.id,
      image: 'pet_1.jpg',
      description: 'tst dogg',
      name: 'Fido',
      approx_age: 3,
      sex: 'male',
      adoptable?: true
      )

    pet_2 = Pet.create(
      shelter_id: shelter_1.id,
      image: 'pet_2.jpg',
      name: 'Louise',
      description: 'tst dogg',
      approx_age: 3,
      sex: 'Female',
      adoptable?: true
      )

    pet_3 = Pet.create(
      shelter_id: shelter_2.id,
      image: 'pet_3.jpg',
      name: 'Spot',
      description: 'tst dogg',
      approx_age: 3,
      sex: 'Male',
      adoptable?: true
      )

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_2.name)

  end
end
