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

  it 'has a button to view all applications' do
    visit "/pets/#{@pets[0].id}"

    expect(page).to have_link('View Applications')
    click_link 'View Applications'
    expect(current_path).to eq("/pets/#{@pets[0].id}/applications")
    expect(page).to have_content(@application.name)
    click_on @application.name
    expect(current_path).to eq("/application/#{@application.id}")
  end
end
