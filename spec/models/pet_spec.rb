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
    it 'can find shelter name and return adoption status' do
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

      expect(pet_1.shelter_name).to eq(shelter_1.name)
      expect(pet_1.adoption_status).to eq('Available for Adoption')
    end
  end

end
