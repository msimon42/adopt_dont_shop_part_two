class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_applications
  has_many :applications, through: :pet_applications
  validates_presence_of :name, :approx_age, :description, :image, :sex
  validates_numericality_of :approx_age

  def shelter_name
    self.shelter.name
  end

  def self.with_applications
    joins(:applications).distinct
  end

  def self.app_count
    joins(:applications).count
  end

  def adopter_name
    Application.find(self.adopter_id).name
  end
end
