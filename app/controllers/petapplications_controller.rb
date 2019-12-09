class PetapplicationsController < ApplicationController
  def new
    ids = session[:favorites]
    @favorited_pets = Pet.find(ids).map {|pet| [pet.id, pet.name]}
  end

  def create
    new_app = Application.create(application_params)
    if new_app.save
      params[:pet].each do |id, val|
        if val == '1'
          pet = Pet.find(id)
          new_app.pets << pet
          @favorites.remove(pet.id.to_s)
          session[:favorites] = @favorites.pets
        end
      end
      flash[:happy] = 'Application submitted.'
      redirect_to '/favorites'
    else
      redirect_back fallback_location: "/application/new"
      flash[:sad] = 'Error: Application not submitted. Please fill all fields. '
    end
  end

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
  end

  def index
    pet = Pet.find(params[:id])
    @pet_name = pet.name
    @applications = pet.applications
  end

  def update
    pet = Pet.find(params[:id])
    application = Application.find(params[:app_id])
    if !pet.adoptor_name
      pet.update(adoption_status: 'pending',
      adoptor_name: application.name)
      redirect_to "/pets/#{pet.id}"
    else
      flash[:sad] = "Sorry, this pet is on hold for someone better."
      redirect_back fallback_location: "/application/#{application.id}"
    end
  end

  private

  def application_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description)
  end
end
