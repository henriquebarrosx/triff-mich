# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # @body: user: { name:string, email:string, password:string }
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors }
    end
  end

  def recovery_email
    @mailer = Users::SentEmail.call(user_params)
    render json: @mailer
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
