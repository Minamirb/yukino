# -*- coding: utf-8 -*-
class SessionsController < ApplicationController
  def create
    auth = Auth.find_or_create_form_auth_hash(auth_hash)
    session[:auth_id] = auth.id
    redirect_to root_path, notice: 'ログインしました'
  end

  def destroy
    session[:auth_id] = nil
    redirect_to root_path, notice: "ログアウトしました"
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
