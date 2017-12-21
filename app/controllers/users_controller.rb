class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  # after_action :validate_user, only: [:create, :update]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  private

  # def validate_user
  #   if @user.valid?
  #     @user.save
  #     redirect_to user_path(@user)
  #   else
  #     flash[:error] = @user.errors.full_messages
  #     redirect_to new_user_path
  #   end
  # end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height)
  end

end
