class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Logged in with #{@user.email}"
      redirect_to dashboard_path
    else
      flash[:message] = "Account creation has failed."
      redirect_to login_path
    end
  end

  def show
    if !current_user.nil?
      @user = current_user
      @ebooks = current_user.ebooks
    else
      not_found
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name, :street_address, :city, :zip_code)
    end

end