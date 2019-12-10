class Application < ApplicationRecord
  has_many :pet_applications, :dependent => :destroy
  has_many :pets, through: :pet_applications
  validates_presence_of :name, :address, :city, :state, :zip, :phone_number, :description

end
