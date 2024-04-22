class Ingredient < ApplicationRecord
  validates :name, :price, presence: true
end
