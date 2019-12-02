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


    visit "shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content("Address: #{shelter_1.address}")
    expect(page).to have_content("City: #{shelter_1.city}")
    expect(page).to have_content("State: #{shelter_1.state}")
    expect(page).to have_content("Zip: #{shelter_1.zip}")

  end

  it 'can see reviews' do
    shelter_1 = Shelter.create(
      name: 'Shelter of Dog',
      address: '123 main street',
      city: 'Denver',
      state: 'CO',
      zip: '80234'
    )

    review_1 = Review.create(
      title: 'Really bad',
      rating: 1,
      content: 'Literally the worst shelter I have ever seen. You should be ashamed of yourselves.',
      image: 'test.png',
      created_at: Time.now,
      shelter_id: shelter_1.id

    )

    visit "shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.title)
    expect(page).to have_content(shelter_1.rating)
    expect(page).to have_content(shelter_1.content)
    expect(page).to have_content(shelter_1.created_at)

    
  end
end
