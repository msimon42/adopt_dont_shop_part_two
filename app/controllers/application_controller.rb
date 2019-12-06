class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :favorite_cookie

  def favorite_cookie
    if !session[:favorites]
      flash[:secondary] = "This site uses cookies in order to provide you with
      the best possible experience. By continuing, you agree to have cookies
      stored on your computer."
    end
    session[:favorites] ||= Array.new
    @favorites ||= Favorite.new(session[:favorites])
    @favorite_count = session[:favorites].length
  end
end
