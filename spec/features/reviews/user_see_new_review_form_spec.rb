RSpec.describe 'new review form', type: :feature do

  before :each do
    @shelter_1 = create :random_shelter
    @reviews = create_list(:random_review, 5, shelter: @shelter_1)
  end

  it 'can render fields' do
    shelter_1 = Shelter.create(
      name: 'Shelter of Dog',
      address: '123 main street',
      city: 'Denver',
      state: 'CO',
      zip: '80234'
    )

    visit "/shelters/#{@shelter_1.id}/add-review"

    expect(page).to have_field('Title')
    expect(page).to have_field('Image file')
    expect(page).to have_field('Comment')
    expect(page).to have_field('Rating')

    fill_in 'Title', with: 'A Terrible Experience with Terrible People'
    fill_in 'Image file', with: 'pebbles.png'
    fill_in 'Comment', with: 'When I entered the shelter, a woman by the name of Maud told me my nose was too big. Very bad form.'
    select 1, :from => :rating

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    expect(page).to have_content('A Terrible Experience with Terrible People')
  end
end
