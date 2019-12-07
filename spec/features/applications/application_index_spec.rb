require 'rails_helper'

RSpec.describe 'When a user visits a pet show page', type: :feature do
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

  it 'has a button to view all applications' do
    visit "/pets/#{@pets[0].id}"

    expect(page).to have_button('View Applications')
    click_button 'View Applications'
    expect(current_path).to eq("/pets/#{@pets[0].id}/applications")
    expect(page).to have_content(@application.name)
    click_on @application.name
    expect(current_path).to eq("/application/#{@application.id}")
  end
end
