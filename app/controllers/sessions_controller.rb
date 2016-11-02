class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(user_params[:email])
               .try(:authenticate, user_params[:password])
    if user
      session[:auth_token] = user.auth_token
      redirect_to root_path
    else
      flash[:error] = "Incorrect credentials"
      redirect_to login_path
    end
  end

  def destroy
    session[:auth_token] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
