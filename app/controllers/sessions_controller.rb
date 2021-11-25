class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:user_requested_path) || tests_path
    else
      redirect_to login_path, danger: 'Are you a Guru? Please input your Email and Password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, success: 'See you later'
  end
end
