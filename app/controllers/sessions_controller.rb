class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    unless @auth = Authorization.find_from_hash(auth)
      # Si no existia la autorizacion entonces creamos tanto el usuario como la autorizacion
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    # Log the authorizing user in.
    self.current_user = @auth.user

    # Para volver a donde el usuario estaba antes de haberse logueado (obtenido de: https://github.com/intridea/omniauth/wiki/Saving-User-Location)
    redirect_to request.env['omniauth.origin'] || '/default'
  end

  def destroy
      session[:user_id] = nil #esta variable session parece ser algo interno, perteneciente al ActionController

      # Se redirecciona al post en el que se estaba gracias al parametro post_id que se le pasa.
      respond_to do |format|
        format.html { redirect_to(post_url(params[:post_id]))}
        format.xml  { head :ok }
      end
  end
end
