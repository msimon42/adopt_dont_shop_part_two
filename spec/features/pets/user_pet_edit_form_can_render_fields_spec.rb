RSpec.describe 'edit pet form', type: :feature do
  before :each do
    Shelter.delete_all
    Pet.delete_all
    @shelter_1 = create :random_shelter
    @pet_1 = create :random_pet, shelter: @shelter_1

  end

  it 'can render fields and edit pet' do
    visit "/pets/#{@pet_1.id}/edit"

    expect(page).to have_field('Name')
    expect(page).to have_field('Image')
    expect(page).to have_field('Description')
    expect(page).to have_field('Approx age')

    fill_in 'Description', with: 'Half breed golden retriever'
    fill_in 'Approx age', with: '4'

    click_button 'Submit'

    expect(current_path).to eq("/pets/#{@pet_1.id}")
    expect(page).to have_content('4')
    expect(page).to have_content('Half breed golden retriever')
  end
end
