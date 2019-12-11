class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new(shelter_params)
    if @shelter.save
      redirect_to "/shelters"
      flash[:happy] = "#{@shelter.name} has been created."
    else
      flash[:sad] = 'Failed to create shelter. Be sure to provide all required information.'
      render :new
    end
  end

  def show
    @shelter = Shelter.find(params[:id])
    if params[:sorted] == 'rating'
      @reviews = @shelter.reviews.sort_by_rating
    elsif params[:sorted] == 'date'
      @reviews = @shelter.reviews.sort_by_date  
    else
      @reviews = @shelter.reviews
    end
    @app_count = @shelter.applications
    @pet_count = @shelter.pet_count
    @avg_rating = @shelter.avg_rating
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
      redirect_back fallback_location: "/shelters/#{shelter.id}"
    end
  end

  def destroy
    if shelter.approved_pets?
      flash[:sad] = 'Shelter with approved applications cannot be deleted.'
      redirect_back fallback_location: '/shelters/'
    else
      shelter.pets.each {|pet| pet.remove_favorite(@favorites)}
      Shelter.destroy(params[:id])
      redirect_to "/shelters/"
      flash[:happy] = 'Shelter successfully deleted.'
    end
  end

  private

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end

  def shelter
    Shelter.find(params[:id])
  end

end
