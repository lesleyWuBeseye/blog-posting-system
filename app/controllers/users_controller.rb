# frozen_string_literal: true

# Controll users action
class UsersController < ApplicationController
  before_action :find_user, only: %i[edit update destroy]

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
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
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

  def destroy
    @user.destroy if @user.present?
    redirect_to users_path, notice: 'User successfully deleted'
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
