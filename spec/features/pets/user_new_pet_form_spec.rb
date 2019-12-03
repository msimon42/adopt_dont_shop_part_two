RSpec.describe 'new pet form', type: :feature do

  before :each do
    @shelter_1 = create :random_shelter
    @pet_1 = create :random_pet, shelter: @shelter_1

  end

  it 'can render fields' do
    visit "/shelters/#{@shelter_1.id}/pets/new"

    expect(page).to have_field('Name')
    expect(page).to have_field('Image file')
    expect(page).to have_field('Description')
    expect(page).to have_field('Approx age')
    expect(page).to have_content('Male')
    expect(page).to have_content('Female')

    fill_in 'Name', with: @pet_1.name
    fill_in 'Image file', with: @pet_1.image
    fill_in 'Description', with: @pet_1.description
    fill_in 'Approx age', with: @pet_1.approx_age
    choose  'gender', with: @pet_1.sex

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content(@pet_1.name)
  end
end
