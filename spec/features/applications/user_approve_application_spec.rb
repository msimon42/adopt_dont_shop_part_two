require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do
    Shelter.delete_all
    Pet.delete_all
    Application.delete_all

    @shelter_1 = create :random_shelter
    @pets = create_list(:random_pet, 2, shelter: @shelter_1)
    @application = create_list(:random_application, 2)

    @application[0].pets << @pets[0]
    @application[0].pets << @pets[1]

    @application[1].pets << @pets[0]
    @application[1].pets << @pets[1]
  end
  it "can approve application" do
    visit "/application/#{@application[0].id}"

    within ("#pet-app-#{@pets[0].id}") do
      click_button "Approve Pet Application"
    end

    expect(current_path).to eq("/pets/#{@pets[0].id}")
    expect(page).to have_content("Pending")
    expect(page).to have_content("On hold for #{@application[0].name}")

    visit "/application/#{@application[0].id}"

    within ("#pet-app-#{@pets[1].id}") do
      click_button "Approve Pet Application"
    end

    expect(current_path).to eq("/pets/#{@pets[1].id}")
    expect(page).to have_content("Pending")
    expect(page).to have_content("On hold for #{@application[0].name}")


  end

  it 'will not approve application if pet is on hold' do
    visit "/application/#{@application[0].id}"

    within ("#pet-app-#{@pets[0].id}") do
      click_button "Approve Pet Application"
    end

    visit "/application/#{@application[1].id}"

    within ("#pet-app-#{@pets[0].id}") do
      click_button "Approve Pet Application"
    end

    expect(page).to have_content('Sorry, this pet is on hold for someone better.')
    expect(current_path).to eq("/application/#{@application[1].id}")
  end

end
