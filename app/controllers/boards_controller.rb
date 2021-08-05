# frozen_string_literal: true

# Controll board action
class BoardsController < ApplicationController
  before_action :user, only: %i[create]
  before_action :find_board, only: %i[edit update destroy]

  def index
    @boards = Board.all.order(:created_at)
  end

  def new
    @board = Board.new
  end

  def create
    @board = @user.boards.new(board_params)

    if @board.save
      redirect_to boards_path, notice: 'Board successfully created'
    else
      flash[:errors] = @board.errors.full_messages
      redirect_to new_board_path
    end
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to boards_path, notice: 'Board successfully updated'
    else
      flash[:errors] = @board.errors.full_messages
      redirect_to edit_board_path
    end
  end

  def destroy
    @board.destroy if @board.present?
    redirect_to boards_path, notice: 'Board successfully deleted'
  end

  private

  def find_board
    @board = Board.find_by(id: params[:id])
  end

  def user
    @user = User.find_by(username: params[:board][:username])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
