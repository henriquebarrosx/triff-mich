class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: { message: "Formato de envio para cadastro de usuário inválido" }
    end 
  end

  def put
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end  
end
