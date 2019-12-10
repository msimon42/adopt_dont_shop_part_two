require 'rails_helper'

RSpec.describe "When I click the Delete All button", type: :feature do
  before :each do
    Shelter.delete_all
    Pet.delete_all
    @shelter_1 = create :random_shelter
    @pets = create_list(:random_pet, 10, shelter: @shelter_1)
  end

    it "all the favorites are deleted" do

    visit "/pets/#{@pets[1].id}"
    expect(page).to have_button('Favorite')

    click_on 'Favorite'

    visit "/favorites"

    expect(page).to have_content(@pets[1].name)

    click_button 'Remove All Favorite Pets'

    expect(page).to_not have_content(@pets[1].name)
    expect(page).to have_content('You have no favorites :(')
  end
end
