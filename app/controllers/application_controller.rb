class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :favorite_cookie

  def favorite_cookie
    cookies[:favorites] ||= ''
  end
end
