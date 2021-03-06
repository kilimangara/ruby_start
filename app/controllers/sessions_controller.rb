class SessionsController < ApplicationController

  def create
    @user = User.where(email: params[:email]).first
    if @user&.confirmed? and @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, success: 'You have signed in'
    else
      redirect_to login_path, danger: 'Invalid email pr password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
