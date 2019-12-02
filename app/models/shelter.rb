class Shelter < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :pets, :dependent => :destroy

  def find_pets
    pets = Pet.where(shelter_id: self.id)
  end

  def pet_count
    self.find_pets.count
  end     
end
