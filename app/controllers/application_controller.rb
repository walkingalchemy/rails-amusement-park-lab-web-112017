class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorized

  helper_method :logged_in?

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
    end
  end


  def logged_in?
    !!current_user
  end

  # def logout
  #   session[:user_id] = nil #bomb for us?
  # end

  def authorized
    if !logged_in?
      redirect_to signin_path
    end

    # redirect_to login_path unless logged_in?
  end
end
