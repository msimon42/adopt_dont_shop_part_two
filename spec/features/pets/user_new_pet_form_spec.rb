RSpec.describe 'new pet form', type: :feature do

  before :each do
    Shelter.delete_all
    @shelter_1 = create :random_shelter
  end

  it 'can render fields' do
    visit "/shelters/#{@shelter_1.id}/pets/new"

    expect(page).to have_field('Name')
    expect(page).to have_field('Image')
    expect(page).to have_field('Description')
    expect(page).to have_field('Approx age')
    expect(page).to have_content('Male')
    expect(page).to have_content('Female')

    fill_in 'Name', with: 'Coco'
    fill_in 'Image', with: 'test.jpg'
    fill_in 'Description', with: 'test 123'
    fill_in 'Approx age', with: '1203423'
    choose  'sex', with: 'Female'

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")
    expect(page).to have_content('Coco')
  end

  it 'renders error message when user fails to properly fill in form' do
    visit "/shelters/#{@shelter_1.id}/pets/new"

    expect(page).to have_field('Name')
    expect(page).to have_field('Image')
    expect(page).to have_field('Description')
    expect(page).to have_field('Approx age')
    expect(page).to have_content('Male')
    expect(page).to have_content('Female')

    fill_in 'Name', with: 'Coco'
    fill_in 'Image', with: 'test.jpg'
    fill_in 'Description', with: 'test 123'

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets/new")
    expect(page).to have_content('Failed to create pet. Be sure to provide all required information.')
  end
end
