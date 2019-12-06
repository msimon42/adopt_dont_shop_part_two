class PetapplicationsController < ApplicationController
  def new
    ids = session[:favorites]
    @favorited_pets = Pet.find(ids).map {|pet| pet.name}
  end
end
