require 'rails_helper'

RSpec.describe 'When user clicks delete button', type: :feature do
  before :each do
        PetApplication.destroy_all
        Application.destroy_all
        Pet.destroy_all
        Shelter.destroy_all

        @shelter = create :random_shelter
        @pets = create_list(:random_pet, 3, shelter: @shelter)
        @reviews = create_list(:random_review, 2, shelter: @shelter)
        @application = create :random_application
        @favorites = Favorite.new([@pets[0].id.to_s, @pets[1].id.to_s, @pets[2].id.to_s])
        @application.pets << @pets[0]
        @shelters = create_list(:random_shelter, 2)

      end



    it 'can delete the shelter' do

      visit "/shelters/#{@shelters[1].id}"
      click_button 'Delete'

      expect(current_path).to eq('/shelters/')
      expect(page).to have_no_content(@shelters[1].name)
    end

    it "will not delete a shelter with an approved pet" do

      visit "/application/#{@application.id}"

      within ("#pet-app-#{@pets[0].id}") do
        click_button "Approve Pet Application"
      end

      visit "/shelters/#{@shelter.id}"

      within ("#shelterlol") do
        click_button 'Delete'
      end

      expect(page).to have_content('Shelter with approved applications cannot be deleted.')
    end
 end
