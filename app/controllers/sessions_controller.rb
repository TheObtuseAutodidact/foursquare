class SessionsController < ApplicationController
  def create
    # render json: request.env["omniauth.auth"]

    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to users_show_path
  end
end
