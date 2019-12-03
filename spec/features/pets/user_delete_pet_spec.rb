RSpec.describe 'When user clicks delete button on pet page', type: :feature do

  before :each do
    @shelter_1 = create :random_shelter
    @pets = create_list(:random_pet, 2, shelter: @shelter_1)
  end


  it 'will delete the pet' do
    visit "/pets/#{@pets[1].id}"
    click_button 'Delete'
    expect(current_path).to eq("/pets/")
    expect(page).to have_no_content(@pets[1].name)
  end
end
