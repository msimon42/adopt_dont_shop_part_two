class PetapplicationsController < ApplicationController
  def new
    ids = cookies[:favorites].split(',').uniq
    @favorited_pets = Pet.find(ids).map {|pet| pet.name}
  end
end
