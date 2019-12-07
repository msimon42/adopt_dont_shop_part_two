require 'rails_helper'

RSpec.describe 'When a user visits the application show page' do

  before :each do
    @shelter_1 = create :random_shelter
    @pets = create_list(:random_pet, 2, shelter: @shelter_1)
    @application = Application.create(
      name: 'Aloicious Hardbottom',
      address: '123 Long RD',
      city: 'Denver',
      state: 'CO',
      zip: '80218',
      phone_number: '555-555-5555',
      description: 'I am not a terrible person.'
    )

    @application.pets << @pets[0]
  end

  it 'can show application info' do
    visit "/application/#{@application.id}"
    expect(page).to have_content(@application.name)
    expect(page).to have_content(@application.address)
    expect(page).to have_content(@application.city)
    expect(page).to have_content(@application.state)
    expect(page).to have_content(@application.zip)
    expect(page).to have_content(@application.description)
    expect(page).to have_content(@pet[0].name)

    click_on @pet[0].name
    expect(current_path).to eq("/pets/#{@pets[0].id}")
  end

  end
