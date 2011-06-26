class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    unless @auth = Authorization.find_from_hash(auth)
      # Si no existia la autorizacion entonces creamos tanto el usuario como la autorizacion
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    # Log the authorizing user in.
    self.current_user = @auth.user

    # Una vez creada la sesion se redirecciona al indice de posts (esto hay que cambiarlo)
    redirect_to(posts_url, :notice => 'Te has logueado')
  end
end
