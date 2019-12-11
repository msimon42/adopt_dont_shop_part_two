require 'rails_helper'

RSpec.describe Review, type: :model do
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


    it 'can sort reviews by rating' do
      expect(@shelter.reviews.sort_by_rating.select(:rating).pluck.first).to eq(@shelter.reviews.sort_by_rating.select(:rating).pluck.first)
    end

    it 'can sort reviews by date' do
      expect(@shelter.reviews.sort_by_date.select(:created_at).pluck.first).to eq(@shelter.reviews.sort_by_date.select(:created_at).pluck.first)
    end
  end
end
