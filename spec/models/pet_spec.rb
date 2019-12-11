require 'rails_helper'

describe Pet, type: :model do
  describe "validations" do
    it {should validate_presence_of :image}
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :approx_age}
    it {should validate_presence_of :sex}
    it {should validate_numericality_of :approx_age}
  end

  describe 'methods' do
    before :each do
      PetApplication.destroy_all
      Application.destroy_all
      Pet.destroy_all
      Shelter.destroy_all

      @shelter = create :random_shelter
      @pets = create_list(:random_pet, 3, shelter: @shelter)
      @reviews = create_list(:random_review, 2, shelter: @shelter)
      @application = create :random_application
      @favorites = Favorite.new([@pets[0].id.to_s])
      @application.pets << @pets[0]
    end


    it "can find information on pets" do

      pet_1 = Pet.create(name: "Phil", approx_age: 27, sex: "Male", image: "tst.jpg", adopter_id: "#{@application.id}")

      expect(@pets[0].shelter_name).to eq(@shelter.name)
      expect(Pet.with_applications).to eq([@pets[0]])
      expect(Pet.app_count).to eq(1)
      expect(pet_1.adopter_name).to eq(@application.name)

      @pets[0].remove_favorite(@favorites)
      expect(@favorites.pets).to eq([])

      expect(Pet.approved).to eq([@pets[0]])
      end
    end

  end
