# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
