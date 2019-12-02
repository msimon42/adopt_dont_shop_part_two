require 'rails_helper'

RSpec.describe 'pets_view_page', type: :feature do
  it 'can see all pets' do

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
      description: 'a pet',
      name: 'Fido',
      approx_age: 3,
      sex: 'male',
      adoptable?: true

      )

    visit '/pets/'

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(shelter_1.name)
  end
end
