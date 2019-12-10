require 'rails_helper'

RSpec.describe 'When I visit my favorites page', type: :feature do
  before :each do
    Shelter.delete_all
    Pet.delete_all
    
    @shelter_1 = create :random_shelter
    @pets = create_list(:random_pet, 10, shelter: @shelter_1)

    visit "/pets/#{@pets[0].id}"
    click_on 'Favorite'

    visit "/pets/#{@pets[1].id}"
    click_on 'Favorite'
  end

  it 'has a button to application' do
    visit '/favorites'

    click_link 'Apply for Pets'
    expect(current_path).to eq('/application/new')
  end
end
