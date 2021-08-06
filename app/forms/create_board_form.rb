# frozen_string_literal: true

# Create board
class CreateBoardForm
  include ActiveModel::Validations
  attr_reader :owner, :name

  validates :name, presence: true
  validate :verify_owner

  def initialize(owner:, name:)
    @owner = owner
    @name = name
  end

  def save
    return false unless valid?

    user.boards.create(name: name)
  end

  private

  def verify_owner
    return if owner.present?

    errors.add(:board, 'owner is invalid')
  end
end
