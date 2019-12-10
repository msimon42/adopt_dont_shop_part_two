require 'rails_helper'

RSpec.describe 'pets_view_page', type: :feature do
  before :each do
    Shelter.delete_all
    Review.delete_all
    @shelter_1 = create :random_shelter
    @pet_1 = create :random_pet, shelter: @shelter_1
  end

  it 'can see all pets' do

    visit '/pets/'

    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@shelter_1.name)
  end
end
