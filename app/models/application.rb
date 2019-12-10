class Application < ApplicationRecord
  has_many :pet_applications, :dependent => :destroy
  has_many :pets, through: :pet_applications
  validates_presence_of :name, :address, :city, :state, :zip, :phone_number, :description

  def add_pets(params, favorites)
    params.each do |id, val|
      if val == '1'
        pet = Pet.find(id)
        self.pets << pet
        favorites.remove(pet.id.to_s)
      end
    end
  end
end
