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
    it 'can find pets' do
      shelter_1 = Shelter.create(
        name: 'Shelter of Dog',
        address: '123 main street',
        city: 'Denver',
        state: 'CO',
        zip: '80234'
      )

      pet_1 = Pet.create(
        shelter_id: shelter_1.id,
        image: 'pet_1.jpg',
        name: 'Fido',
        description: 'Golden Retriver',
        approx_age: 3,
        sex: 'male',
        adoptable?: true

        )

      pet_2 = Pet.create(
        shelter_id: shelter_1.id,
        image: 'pet_2.jpg',
        name: 'Doggo',
        description: 'Black',
        approx_age: 4,
        sex: 'female',
        adoptable?: true

        )

      expect(shelter_1.find_pets).to eq([pet_1, pet_2])
      expect(shelter_1.pet_count).to eq(2)
    end
  end
end
