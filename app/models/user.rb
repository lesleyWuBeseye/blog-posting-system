# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :username, length: { minimum: 8 }
  validates :email, format: { with: /\A[\w.]+@example.com\Z/i,
                              message: 'must contain `@example.com` characters' }
end