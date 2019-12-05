class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :favorite_cookie

  def favorite_cookie
    session[:favorites] ||= Array.new
    @favorites ||= Favorite.new(session[:favorites])
    @favorite_count = session[:favorites].length
  end
end
