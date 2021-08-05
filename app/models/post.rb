# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :board
  has_many   :replies, class_name: 'Post', foreign_key: 'article_id'
  belongs_to :article, class_name: 'Post', optional: true
end
