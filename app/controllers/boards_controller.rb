# frozen_string_literal: true

# Controll board action
class BoardsController < ApplicationController
  before_action :user, only: %i[create]

  def index
    # @boards = Boards.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = @user.boards.new(board_params)

    if @board.save
      redirect_to boards_path, notice: 'Board successfully created'
    else
      # TODO: handle error message flash
      render :new
    end
  end

  private

  def user
    @user = User.find_by(username: params[:board][:username])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
