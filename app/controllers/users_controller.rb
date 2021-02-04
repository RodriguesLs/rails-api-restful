class UsersController < ApplicationController
  before_action :set_user, only: %i(update show destroy)
  
  def index
    render json: User.all, status: :ok
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def update
    @user.update(user_params)

    if @user.save
      render json: @user, status: :ok
    else
      render json: { errors: user.erros.full_messages } 
    end
  end

  def show
    render json: @user
  end

  def destroy
    @user.destroy
  end

  private
  
    def set_user
      @user ||= User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
