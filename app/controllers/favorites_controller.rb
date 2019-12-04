class FavoritesController < ApplicationController
  def index
    ids = cookies[:favorites].split(',').uniq
    @favorited_pets = Pet.find(ids)
    @favorite_count = @favorited_pets.length
  end

  def create

  end

  def update
    pet_id = params[:pet_id]
    cookies[:favorites] += "#{pet_id},"
  end
end
