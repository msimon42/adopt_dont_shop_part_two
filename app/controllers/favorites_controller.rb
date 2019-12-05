class FavoritesController < ApplicationController
  def index
    ids = cookies[:favorites].split(',').uniq
    @favorited_pets = Pet.find(ids)
    @favorite_count = @favorited_pets.length
  end

  def create

  end

  def delete_all
    cookies[:favorites] = ""
    redirect_to "/favorites"
  end

  def update
    pet_id = params[:pet_id]
    redirect_to "/pets/#{pet_id}"
    @favorites.add(cookies[:favorites])
    flash[:happy] = 'Pet added to favorites.'
  end

  def destroy
    pet_id = params[:pet_id]
    new_favorites = cookies[:favorites].gsub("#{pet_id},", '')
    cookies[:favorites] = new_favorites
    redirect_back fallback_location: '/pets/'
    flash[:happy] = 'Pet Removed from Favorites.'
  end
end
