class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
  end

  def create

    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      # YOU ARE WHO YOU SAY YOU ARE
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = ["Username and password do not match"]
      redirect_to signin_path
    end
  end

  def destroy
    # get logged out
    session[:user_id] = nil
    # redirect to login
    redirect_to signin_path
  end
end
