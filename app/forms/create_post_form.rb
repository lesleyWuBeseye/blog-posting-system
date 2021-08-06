# frozen_string_literal: true

# Create post
class CreatePostForm
  include ActiveModel::Validations
  attr_reader :board, :author, :content, :article_id

  validates :board, :content, presence: true
  validate :verify_author

  def initialize(board:, author:, params:)
    @board = board
    @author = author
    @content = params[:content]
    @article_id = params[:article_id]
  end

  def save
    return false unless valid?

    board.posts.create(user_id: author, content: content, article_id: article_id)
  end

  private

  def verify_author
    return if author.present?

    errors.add(:post, 'author is invalid')
  end
end
