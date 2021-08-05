# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
end
