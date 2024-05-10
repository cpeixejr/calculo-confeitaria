# frozen_string_literal: true

class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.float :price, null: false

      t.timestamps
    end
  end
end
