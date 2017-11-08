class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in with #{user.email}"
      redirect_to dashboard_path if current_user
    else
      redirect_to login_path
    end
  end

  def oauth_login
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Logged Out"
    redirect_to root_path
  end
end
