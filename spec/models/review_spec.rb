require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'methods' do
    before :each do
      PetApplication.destroy_all
      Application.destroy_all
      Pet.destroy_all
      Shelter.destroy_all

      @shelter = create :random_shelter

      @review_1 = Review.create(
        title: 'This place sucks',
        content: 'They didnt give me free water',
        rating: 1,
        created_at: Faker::Time.between(from: DateTime.now - 100, to: DateTime.now),
        shelter_id: @shelter.id
      )

      @review_2 = Review.create(
        title: 'This place rocks',
        content: 'They gave me free water',
        rating: 5,
        created_at: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now - 101),
        shelter_id: @shelter.id
      )
    end


    it 'can sort reviews by rating' do
      expect(@shelter.reviews.sort_by_rating.first).to eq(@review_2)
    end

    it 'can sort reviews by date' do
      expect(@shelter.reviews.sort_by_date.first).to eq(@review_1)
    end
  end
end
