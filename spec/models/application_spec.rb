require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
    it {should validate_presence_of :phone_number}
    it {should validate_presence_of :description}
  end

  describe 'methods' do
    before :each do
      PetApplication.destroy_all
      Application.destroy_all
      Pet.destroy_all
      Shelter.destroy_all

      @shelter = create :random_shelter
      @pets = create_list(:random_pet, 3, shelter: @shelter)
      @application = create :random_application
      @favorites = Favorite.new([@pets[0].id.to_s, @pets[1].id.to_s, @pets[2].id.to_s])
    end

    it 'can generate favorites in pet app form' do
      params = {@pets[0].id.to_s => '1', @pets[1].id.to_s => '1', @pets[2].id.to_s => '0'}
      @application.add_pets(params, @favorites)
      expect(@application.pets).to eq([@pets[0], @pets[1]])
      expect(@favorites.pets).to eq([@pets[2].id.to_s])
    end
  end

end
