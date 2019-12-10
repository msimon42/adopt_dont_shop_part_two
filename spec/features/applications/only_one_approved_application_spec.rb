require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do
    Shelter.delete_all
    Pet.delete_all
    Application.delete_all

    @shelter_1 = create :random_shelter
    @pets = create_list(:random_pet, 2, shelter: @shelter_1)
    @application = create :random_application

    @application.pets << @pets[0]
    @application.pets << @pets[1]
  end
end
