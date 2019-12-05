class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_applications
  has_many :applications, through: :pet_applications
  validates_presence_of :name, :approx_age, :description, :image, :sex
  validates_numericality_of :approx_age

  def shelter_name
    self.shelter.name
  end

  def adoption_status
    return 'Available for Adoption' if self.adoptable?
    'Not available for adoption'
  end

end
