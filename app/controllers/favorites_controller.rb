class FavoritesController < ApplicationController
  def index
    ids = session[:favorites]
    @favorited_pets = Pet.find(ids)
    @favorite_count = @favorited_pets.length
  end

  def create

  end

  def delete_all
    session[:favorites] = Array.new
    redirect_to "/favorites"
  end

  def update
    pet_id = params[:pet_id]
    redirect_to "/pets/#{pet_id}"
    @favorites.add(pet_id)
    session[:favorites] = @favorites.pets
    flash[:happy] = 'Pet added to favorites.'
  end

  def destroy
    pet_id = params[:pet_id]
    @favorites.remove(pet_id)
    session[:favorites] = @favorites.pets
    redirect_back fallback_location: '/pets/'
    flash[:happy] = 'Pet Removed from Favorites.'
  end
end
