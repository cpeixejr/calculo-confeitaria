class Ingredient < ApplicationRecord
  validates :name, :price, presence: true

  scope :ordered, -> { order(id: :desc) }
end
