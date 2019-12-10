require 'rails_helper'

describe Shelter, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
  end
  describe "relationships" do
    it {should have_many :pets}
  end

  describe 'methods' do
    before :each do
      PetApplication.destroy_all
      Application.destroy_all
      Pet.destroy_all
      Shelter.destroy_all

      @shelter = create :random_shelter
      @pets = create_list(:random_pet, 3, shelter: @shelter)
      @reviews = create_list(:random_review, 5, shelter: @shelter)
      @application = create :random_application
      @favorites = Favorite.new([@pets[0].id.to_s, @pets[1].id.to_s, @pets[2].id.to_s])
      @application.pets << @pets[0]
    end

    it "can find applications and pet count" do
    expect(@shelter.applications).to eq(1)
    expect(@shelter.pet_count).to eq(3)
    # expect(@shelter.avg_rating).to eq(1)
    end
  end
end
