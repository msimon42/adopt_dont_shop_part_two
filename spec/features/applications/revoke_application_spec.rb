require 'rails_helper'

RSpec.describe 'When a user visits a pet show page', type: :feature do
  before :each do
    Shelter.delete_all
    Pet.delete_all
    Application.delete_all

    @shelter_1 = create :random_shelter
    @pets = create_list(:random_pet, 2, shelter: @shelter_1)
    @application = create :random_application

    @application.pets << @pets[0]
  end

  it "has a button to revoke a pet's application" do

      visit "/application/#{@application.id}"
      click_button 'Approve Pet Application'
      visit "/application/#{@application.id}"
      expect(page).to have_button('Revoke Application')
      click_button 'Revoke Application'
      expect(current_path).to eq("/application/#{@application.id}")
      expect(page).to have_button("Approve Pet Application")
      visit "/pets/#{@pets[0].id}"

      expect(page).to_not have_content("On hold for #{@pets[0].adopter_id}")
   end


end
