# frozen_string_literal: true

# Controll posts action
class PostsController < ApplicationController
  before_action :find_board
  before_action :find_user, only: %i[create]
  before_action :find_post, only: %i[edit update destroy]

  def index
    @posts = @board.posts.filter_articles
  end

  def new
    @post = Post.new
  end

  def create
    @post = @board.posts.new(post_params.merge(user_id: @user.id))

    if @post.save
      redirect_to board_posts_path(@board), notice: 'Article successfully created'
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_board_post_path
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to board_posts_path(@post.board), notice: 'Post successfully updated'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_post_path
    end
  end

  def destroy
    @post.destroy if @post.present?
    redirect_to board_posts_path(@post.board), notice: 'Post successfully deleted'
  end

  private

  def find_post
    @post = Post.find_by(id: params[:id])
  end

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
