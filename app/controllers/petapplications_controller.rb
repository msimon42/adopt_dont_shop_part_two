class PetapplicationsController < ApplicationController
  def new
    ids = session[:favorites]
    @favorited_pets = Pet.find(ids).map {|pet| [pet.id, pet.name]}
  end

  def create
    new_app = Application.create(application_params)
    if new_app.save
      new_app.add_pets(params[:pet], @favorites)
      session[:favorites] = @favorites.pets
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
    if params[:adopted]
      pet.update(adoption_status: 'Available',
                 adopter_id: nil)
      flash[:happy] = 'Application Revoked.'
      redirect_to "/application/#{application.id}"
    elsif pet.adopter_id && pet.adopter_id != application.id.to_s
       flash[:sad] = "Sorry, this pet is on hold for someone better."
       redirect_to "/application/#{application.id}"
    else
      pet.update(adoption_status: 'Pending',
                 adopter_id: application.id)
     flash[:happy] = 'Application Approved.'
     redirect_to "/pets/#{pet.id}"
    end
  end

  # def destroy
  #   binding.pry
  # end

  private

  def application_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description)
  end
end
