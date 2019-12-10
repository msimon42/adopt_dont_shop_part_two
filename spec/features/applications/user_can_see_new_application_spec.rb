require 'rails_helper'

RSpec.describe 'When a user visits the application show page' do

  before :each do
    Shelter.delete_all
    Pet.delete_all
    Application.delete_all
    
    @shelter_1 = create :random_shelter
    @pets = create_list(:random_pet, 2, shelter: @shelter_1)
    @application = create :random_application

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
    expect(page).to have_content(@pets[0].name)

    click_on @pets[0].name
    expect(current_path).to eq("/pets/#{@pets[0].id}")
  end
end
