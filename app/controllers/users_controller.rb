# frozen_string_literal: true

# Controll users action
class UsersController < ApplicationController
  before_action :find_user, only: %i[edit update]

  def index
    @users = User.all.order(:created_at)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'User successfully created'
    else
      # TODO: handle error message flash
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User successfully updated'
    else
      # TODO: handle error message flash
      render :edit
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
