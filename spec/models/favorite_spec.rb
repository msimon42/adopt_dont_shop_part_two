RSpec.describe Favorite do

    it 'can calculate pets information' do

      favorites = Favorite.new(['1', '2', '3'])
      pet_1 = Pet.create(name: "Phil", approx_age: 27, sex: "Male", image: "tst.jpg")


      expect(favorites.total_count).to eq(3)
      favorites.add(pet_1)
      expect(favorites.total_count).to eq(4)
      favorites.remove(pet_1)
      expect(favorites.total_count).to eq(3)
    end
  end
