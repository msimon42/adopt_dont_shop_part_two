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

  it "has a button to revoke a pet's application" do
      visit "/applications/#{@application.id}"

      expect(page).to have_button('Revoke Application')
      click_button 'Revoke Application'
      expect(current_path).to eq("/application/#{@application.id}")
      expect(page).to_not have_content("Revoke Application")
      expect(page).to have_content("Apply for Pet")

      visit "/pets/#{@pets.id}"

      expect(page).to_not have_content("On hold for #{adoptor_name}")
  end


end