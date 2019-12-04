require 'rails_helper'

RSpec.describe 'When I visit the favorites index page', type: :feature do
  before :each do
    @shelter_1 = create :random_shelter
    @pets = create_list (:random_pet, 10, shelter: @shelter_1)
  end

    
end
