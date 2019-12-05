class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :favorite_cookie

  def favorite_cookie
    cookies[:favorites] ||= Array.new
    @favorites = Favorite.new(cookies[:favorites])
    @favorite_count = cookies[:favorites].split(',').uniq.length
  end
end
