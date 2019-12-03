class ShelterpetsController < ApplicationController
  def index
    @shelter = Shelter.find(params[:id])
    @shelter_pets = @shelter.pets
  end
end
