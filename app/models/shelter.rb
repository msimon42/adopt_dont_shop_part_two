class Shelter < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :pets, :dependent => :destroy
  has_many :reviews, :dependent => :destroy

  def approved_pets?
    return true if pets.where.not(adopter_id: nil).length > 0
    false
  end

  def applications
    pets.app_count
  end

  def pet_count
    pets.count
  end

  def avg_rating
    reviews.average(:rating).to_f
  end




end
