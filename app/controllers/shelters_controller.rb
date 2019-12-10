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
      flash[:sad] = 'Failed to create shelter. Be sure to provide all required information.'
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
    shelter = Shelter.find(params[:id])
    shelter.update(shelter_params)
    if shelter.save
      redirect_to "/shelters/#{shelter.id}"
      flash[:happy] = "#{shelter.name} successfully updated."
    else
      flash[:sad] = 'Failed to update shelter. Be sure to provide all required information.'
      render :new
    end
  end

  def destroy
    shelter = Shelter.find(params[:id])
    if shelter.approved_pets?
      flash[:sad] = 'Shelter with approved applications cannot be deleted.'
      redirect_back fallback_location: '/shelters/'
    else
      Shelter.destroy(params[:id])
      redirect_to "/shelters/"
      flash[:happy] = 'Shelter successfully deleted.'
    end
  end

  private

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end

end
