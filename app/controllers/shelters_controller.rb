class SheltersController < ApplicationController
  def shelters
    @shelters = Shelter.all
  end

  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
      })
    @shelter.save
    redirect_to "/shelters"
  end

  def show
    @shelter = Shelter.find(params[:id])
    @reviews = @shelter.reviews
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    @shelter = Shelter.find(params[:id])
    @shelter.update({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip]
      })
    @shelter.save
    redirect_to "/shelters/#{@shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to "/shelters/"
  end

  def pets
    @shelter = Shelter.find(params[:id])
    @shelter_pets = @shelter.find_pets
  end

  private





end
