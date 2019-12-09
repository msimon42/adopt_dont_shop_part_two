require 'rails_helper'

RSpec.describe "As a visitor" do
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
    @application.pets << @pets[1]
  end
  it "can approve application" do
    visit "/application/#{@application.id}"

    within ("#pet-app-#{@pets[0].id}") do
      click_button "Approve Pet Application"
    end

    expect(current_path).to eq("/pets/#{@pets[0].id}")
    expect(page).to have_content("pending")
    expect(page).to have_content("On hold for #{@application.name}")

    visit "/application/#{@application.id}"

    within ("#pet-app-#{@pets[1].id}") do
      click_button "Approve Pet Application"
    end

    expect(current_path).to eq("/pets/#{@pets[1].id}")
    expect(page).to have_content("pending")
    expect(page).to have_content("On hold for #{@application.name}")


  end

end