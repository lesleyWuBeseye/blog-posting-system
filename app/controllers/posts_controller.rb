# frozen_string_literal: true

# Controll posts action
class PostsController < ApplicationController
  before_action :find_board
  before_action :find_user, only: %i[create]

  def new
    @post = Post.new
  end

  def create
    @post = @board.posts.new(post_params.merge(user_id: @user.id))

    if @post.save
      redirect_to boards_path, notice: 'Article successfully created'
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_board_post_path
    end
  end

  private

  def find_user
    @user = User.find_by(username: params[:post][:author])
  end

  def find_board
    @board = Board.find_by(id: params[:board_id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
