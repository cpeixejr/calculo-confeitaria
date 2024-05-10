# frozen_string_literal: true

class Ingredient < ApplicationRecord
  validates :name, :price, presence: true

  belongs_to :user

  broadcasts_to ->(ingredient) { [ingredient.user, 'ingredients'] }, inserts_by: :prepend

  scope :ordered, -> { order(id: :desc) }
end
