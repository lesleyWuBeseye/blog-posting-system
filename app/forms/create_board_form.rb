# frozen_string_literal: true

# Create board
class CreateBoardForm
  include ActiveModel::Validations
  attr_reader :owner, :name

  validates_presence_of :name
  validate :verify_owner, :verify_name

  def initialize(owner:, name:)
    @owner = owner
    @name = name
  end

  def save
    return false unless valid?

    owner.boards.create(name: name)
  end

  def board
    @board ||= Board.find_by(name: name)
  end

  private

  def verify_owner
    return if owner.present?

    errors.add(:board, 'owner is invalid')
  end

  def verify_name
    return unless board.present?

    errors.add(:board, 'name is exist')
  end
end
