RSpec.describe 'new review form', type: :feature do

  before :each do
    Shelter.delete_all
    @shelter_1 = create :random_shelter
  end

  it 'can render fields' do
    shelter_1 = Shelter.create(
      name: 'Shelter of Dog',
      address: '123 main street',
      city: 'Denver',
      state: 'CO',
      zip: '80234'
    )

    visit "/shelters/#{@shelter_1.id}/new-review"

    expect(page).to have_field('Title')
    expect(page).to have_field('Image')
    expect(page).to have_field('Content')
    expect(page).to have_field('Rating')
  end

  it 'can create a review' do
    visit "/shelters/#{@shelter_1.id}/new-review"

    fill_in 'Title', with: 'A Terrible Experience with Terrible People'
    fill_in 'Image', with: 'pebbles.png'
    fill_in 'Content', with: 'When I entered the shelter, a woman by the name of Maud told me my nose was too big. Very bad form.'
    select 1, :from => :rating

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    expect(page).to have_content('A Terrible Experience with Terrible People')
  end

  it 'requires user to enter all fields' do
    visit "/shelters/#{@shelter_1.id}/new-review"

    fill_in 'Title', with: 'A Terrible Experience with Terrible People'
    fill_in 'Image', with: 'pebbles.png'

    click_button 'Submit'

    expect(page).to have_content('Failed to submit review. Be sure to provide all required information.')
    expect(current_path).to eq("/shelters/#{@shelter_1.id}/new-review")
  end
end
