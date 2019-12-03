require 'rails_helper'

RSpec.describe 'When user clicks delete button', type: :feature do
  before :each do
    @shelters = create_list(:random_shelter, 2)
  end

  it 'can delete the shelter' do

  visit "/shelters/#{@shelters[1].id}"
  click_button 'Delete'

  expect(current_path).to eq('/shelters/')
  expect(page).to have_no_content(@shelters[1].name)
 end
end
