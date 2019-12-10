RSpec.describe 'When user clicks delete button on pet page', type: :feature do

  before :each do
    Pet.destroy_all
    Shelter.destroy_all
    Application.destroy_all
    @shelter_1 = create :random_shelter
    @pets = create_list(:random_pet, 2, shelter: @shelter_1)
    @application = create :random_application
    @favorites = Favorite.new([])
  end


  it 'will delete the pet' do
    visit "/pets/#{@pets[1].id}"
    click_button 'Delete'
    expect(current_path).to eq("/pets/")
    expect(page).to have_no_content(@pets[1].name)
  end

  it 'will not delete the pet if app is approved' do
      @application.pets << @pets[0]

      visit "/application/#{@application.id}"

      click_button "Approve Pet Application"
      visit "/pets/#{@pets[0].id}"
      click_button 'Delete'
      expect(page).to have_content("Pets with approved applications cannot be deleted.")
      expect(current_path).to eq("/pets/#{@pets[0].id}")
  end

  it 'will remove pet from favorites if deleted' do
    visit "/pets/#{@pets[0].id}"
    click_button 'Favorite'
    click_button 'Delete'
    expect(@favorites.pets).to eq([])

  end
end
