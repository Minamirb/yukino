class SessionsController < ApplicationController
  def create
    auth = Auth.find_or_create_form_auth_hash(auth_hash)
    session[:auth_id] = auth.id
    redirect_to root_path
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
