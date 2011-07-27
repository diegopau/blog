class ApplicationController < ActionController::Base

  protect_from_forgery

  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    !!current_user  # el !! se utiliza para comprobar si existe el current_user (sin los !! se comprobaría si es true o false, pero se quiere comprobar si existe o no existe)
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

end
