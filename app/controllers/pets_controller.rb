class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    pet = @shelter.pets.create(pet_params)
    if pet.save
      redirect_to "/shelters/#{@shelter.id}/pets"
      flash[:happy] = "#{pet.name} has been successfully added to #{@shelter.name}."
    else
      flash[:sad] = 'Failed to create pet. Be sure to provide all required information.'
      render :new
    end
  end

  def edit
    @pet = Pet.find(params[:id])
    @shelter_id = @pet.shelter_id
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    if pet.save
      redirect_to "/pets/#{pet.id}"
      flash[:happy] = "#{pet.name} has been successfully updated."
    else
      flash[:sad] = 'Failed to update pet. Be sure to provide all required information.'
      render :new
    end
  end

  def destroy
    if cookies[:favorites].include?(params[:id])
      flash[:sad] = 'Remove pet from favorites before deleting.'
      redirect_back fallback_location: '/pets/'
    else
      Pet.destroy(params[:id])
      redirect_to "/pets/"
      flash[:happy] = 'Pet successfully deleted.'
    end
  end

  private

  def pet_params
    params.permit(:image, :name, :description, :sex, :approx_age, :adoptable?)
  end
end
