require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do
    Shelter.delete_all
    Pet.delete_all
    Application.delete_all

    @shelter_1 = create :random_shelter
    @pets = create_list(:random_pet, 2, shelter: @shelter_1)
    @application = create :random_application

    @application.pets << @pets[0]
    @application.pets << @pets[1]
  end
  it "can approve application" do
    visit "/application/#{@application.id}"

    within ("#pet-app-#{@pets[0].id}") do
      click_button "Approve Pet Application"
    end

    expect(current_path).to eq("/pets/#{@pets[0].id}")
    expect(page).to have_content("Pending")
    expect(page).to have_content("On hold for #{@application.name}")

    visit "/application/#{@application.id}"

    within ("#pet-app-#{@pets[1].id}") do
      click_button "Approve Pet Application"
    end

    expect(current_path).to eq("/pets/#{@pets[1].id}")
    expect(page).to have_content("Pending")
    expect(page).to have_content("On hold for #{@application.name}")


  end

end
