class Ingredient < ApplicationRecord
  validates :name, :price, presence: true

  broadcasts_to ->(ingredient) { "ingredients" }, inserts_by: :prepend

  scope :ordered, -> { order(id: :desc) }
end
