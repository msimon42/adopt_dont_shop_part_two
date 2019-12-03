class SheltersController < ApplicationController
  def index
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
    if @shelter.save
      redirect_to "/shelters"
    else
      flash[:sad] = 'You have not entered all required information.'
      render :new
    end
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
    @shelter_pets = @shelter.pets
  end
end
