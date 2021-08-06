# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :board
  belongs_to :article, class_name: 'Post', optional: true
  has_many   :replies, class_name: 'Post', foreign_key: 'article_id', dependent: :destroy

  validates :content, presence: true

  scope :filter_articles, -> { where(article_id: nil) }
end
